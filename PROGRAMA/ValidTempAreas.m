function [Alto, Ancho, xTA1, yTA1] = ValidTempAreas(ZonasTemporales, Quantity)
    DispArea = 0;
    AreaOccuped = 0;
    fprintf('Ingrese el extremo inferior izquierdo del area donde estaran las zonas temporales, haciendo clic derecho');
    fprintf('\n');
    [xTA1,yTA1] = getpts;
    fprintf('Ingrese el extremo superior derecho del area donde estaran las zonas temporales, haciendo clic derecho');
    fprintf('\n');
    [xTA2,yTA2] = getpts;
    Ancho = xTA2 - xTA1;
    Alto = yTA2 - yTA1;
    DispArea = Alto * Ancho;
    for Ao=1:size(ZonasTemporales)
        AreaOccuped = AreaOccuped + ((ZonasTemporales(Ao,2)*ZonasTemporales(Ao,3))*Quantity(Ao,2));
    end
    while AreaOccuped > DispArea
        fprintf('El area seleccionada es menor que el area de las zonas temporales. Vuelve a ingresarla \n');
        fprintf('Ingrese el extremo inferior izquierdo del area donde estaran las zonas temporales, haciendo clic derecho');
        fprintf('\n');
        [xTA1,yTA1] = getpts;
        fprintf('Ingrese el extremo superior derecho del area donde estaran las zonas temporales, haciendo clic derecho');
        fprintf('\n');
        [xTA2,yTA2] = getpts;
        Alto = xTA2 - xTA1;
        Ancho = yTA2 - yTA1;
        DispArea = Alto * Ancho;
        for Ao=1:size(ZonasTemporales)
            AreaOccuped = AreaOccuped + ((ZonasTemporales(Ao,2)*ZonasTemporales(Ao,3))*Quantity(Ao,2));
        end
    end
    fprintf('El área es valida para colocar las zonas temporales \n');
end