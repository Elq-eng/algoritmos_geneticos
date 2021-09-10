function DelimitAreasToShow(Dimensions, DataToDraw, NumbAreas, CircleData, ElipseData, TriangleData)
    DimensionArea = [];
    CenterCoord = [];
    %Se valida que el numero de areas sea diferente de 0
    NumberAreas = NumbAreas;
    %Se crea un for que va hasta el numero de areas especificado
    for i=1:NumberAreas
        Elements = '';
        Circles = 0;
        Triangle = 0;
        Elipse = 0;
        DimensionArea(1,1) = DataToDraw(i,1);
        DimensionArea(1,2) = DataToDraw(i,2);
        CenterCoord(1,1) = DataToDraw(i,3);
        CenterCoord(1,2) = DataToDraw(i,4);

        %Se coloca en el terreno la construccion seleccionada
        DrawConstructionsToShow(CenterCoord, DimensionArea, DataToDraw(i,5:7));
        Elements = DataToDraw(i,8);
        ValidElements = 0;
        while ValidElements == 0
            if Elements == 1
                ValidElements = 1;
            elseif Elements == 2
                ValidElements = 1;
            else
                Elements = DataToDraw(i,8);
                ValidElements = 0;
            end
        end
    end
end