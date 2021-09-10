function ColorTerrain = DrawTerrain(Dimensions)
    %Creamos una variable mapa que va a almacenar las coordenadas de los
    %extremos del terreno
    Map = [];
    Map(1,1) = 0;
    Map(1,2) = 0;
    Map(1,3) = Dimensions(1,1);
    Map(1,4) = Dimensions(1,2);
    p1x=Map(1,1:2); %plx es las dos primeras columnas
    p2x=Map(1,3:4); %p2x es las dos ultimas columnas
    %Funcion que dibuja el mapa
    ColorTerrain = Draw_Lines(p1x,p2x);
end