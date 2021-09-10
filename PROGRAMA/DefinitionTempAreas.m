function [ZonasTemporales, Quantity] = DefinitionTempAreas(ZonasTemporales, Quantity)
    fprintf('Ingrese las dimensiones en metros de las zonas temporales \n');
    fprintf('Las zonas temporales son: \n');
    fprintf('1. Baños \n');
    fprintf('2. Maquinas \n');
    fprintf('3. Zona de descarga \n');
    fprintf('4. Zona de mezcla \n');
    for z=1:4
        ZonasTemporales(z,1) = z;
        fprintf('Ingrese el ancho de la zona %d: ',z);
        ZonasTemporales(z,2) = input('');
        fprintf('Ingrese el largo de la zona %d: ',z);
        ZonasTemporales(z,3) = input('');
        fprintf('\n');
    end
    
    for q=1:4
        Quantity(q,1) = q;
        fprintf('Ingrese la cantidad de elementos de la zona %d: ',q);
        Quantity(q,2) = input('');
    end
           
end