function [DataToDraw, NumberAreas] = DelimitAreas(Dimensions)
    DataToDraw = [];
    ElementsToDraw = [];
    NumberAreas = 0;
    DimensionArea = [];
    CenterCoord = [];
    %Se valida que el numero de areas sea diferente de 0
    NumberAreas = input('Ingrese el número de construcciones: ');
    while NumberAreas <= 1
        NumberAreas = input('El numero debe ser mayor a 1. Vuelve a ingresarlo: ');
    end
    %Se crea un for que va hasta el numero de areas especificado
    for i=1:NumberAreas
        Elements = '';
        Circles = 0;
        Triangle = 0;
        Elipse = 0;
        fprintf('Ingrese las dimensiones en metros del area ');
        fprintf('%d',i);
        fprintf('\n');
        DimensionArea(1,1) = input('Ingrese el ancho del lugar: ');
        DimensionArea(1,2) = input('Ingrese el largo del lugar: ');
        DataToDraw(i,1)=DimensionArea(1,1);
        DataToDraw(i,2)=DimensionArea(1,2);
        fprintf('Ingrese las coordenadas del centro del lugar haciendo clic derecho en la zona que desea posicionar la figura ');
        fprintf('%d',i);
        fprintf('\n');
        [xi,yi] = getpts;
        CenterCoord(1,1) = xi;
        CenterCoord(1,2) = yi;
        DataToDraw(i,3)=CenterCoord(1,1);
        DataToDraw(i,4)=CenterCoord(1,2);
        ValidationArea = ValidArea(Dimensions, CenterCoord, DimensionArea);
        %Se crea un while que valida que el area seleccionada este dentro
        %del terreno
        while ValidationArea == 0
            fprintf('El area ingresada esta fuera de los limites. Por favor, ingrese otras dimensiones u otro centro de la figura ');
            fprintf('%d',i);
            fprintf('\n');
            DimensionArea(1,1) = input('Ingrese el ancho del lugar: ');
            DimensionArea(1,2) = input('Ingrese el largo del lugar: ');
            DataToDraw(i,1) = DimensionArea(1,1);
            DataToDraw(i,2) = DimensionArea(1,2);
            fprintf('Ingrese las coordenadas del centro del lugar haciendo clic derecho en la zona que desea posicionar la figura ');
            fprintf('%d',i);
            fprintf('\n');
            [xi,yi] = getpts;
            CenterCoord(1,1) = xi;
            CenterCoord(1,2) = yi;
            DataToDraw(i,3) = CenterCoord(1,1);
            DataToDraw(i,4) = CenterCoord(1,2);
            ValidationArea = ValidArea(Dimensions, CenterCoord, DimensionArea);
        end
        %Se coloca en el terreno la construccion seleccionada
        TerrainColor = DrawConstructions(CenterCoord, DimensionArea);
        DataToDraw(i,5:7) = TerrainColor;
        Elements = input('¿Desea agregar elementos en el area seleccionada? Si= 1, No=2: ');
        DataToDraw(i,8) = Elements;
        ValidElements = 0;
        while ValidElements == 0
            if Elements == 1
                Circles = input('Ingrese la cantidad de elementos circulares: ');
                DataToDraw(i,9) = Circles;
                if Circles > 0
                    DrawCircles(Circles);
                    ValidElements = 1;
                end
                Elipse = input('Ingrese la cantidad de elementos elipticos: ');
                DataToDraw(i,10) = Elipse;
                if Elipse > 0
                    DrawElipse(Elipse);
                    ValidElements = 1;
                end
                Triangle = input('Ingrese la cantidad de elementos triangulares: ');
                DataToDraw(i,11) = Triangle;
                if Triangle > 0
                    DrawTriangle(Triangle);
                    ValidElements = 1;
                end
            elseif Elements == 2
                ValidElements = 1;
                DataToDraw(i,9:11) = 0;
            else
                Elements = input('El dato introducido no corresponde. Por favor, ingresalo de nuevo: ');
                DataToDraw(i,8) = Elements;
                ValidElements = 0;
            end
        end
    end
end