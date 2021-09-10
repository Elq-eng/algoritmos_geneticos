function TerrainColor = DrawConstructions(CenterCoord, DimensionArea)
    PosF1=CenterCoord(1,1)-(DimensionArea(1,1)/2);
    PosF2=CenterCoord(1,2)-(DimensionArea(1,2)/2);
    PosF3=CenterCoord(1,1)+(DimensionArea(1,1)/2);
    PosF4=CenterCoord(1,2)+(DimensionArea(1,2)/2);
    PosFX = [PosF1 PosF2];
    PosFY = [PosF3 PosF4];
    TerrainColor = Draw_Lines(PosFX,PosFY);%se utiliza p1x y p2x para introducir datos a la funcion, y se guardan pa,pb,pc,pd de la funcion llamada
end