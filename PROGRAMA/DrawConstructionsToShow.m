function DrawConstructionsToShow(CenterCoord, DimensionArea, TerrainColor)
    PosF1=CenterCoord(1,1)-(DimensionArea(1,1)/2);
    PosF2=CenterCoord(1,2)-(DimensionArea(1,2)/2);
    PosF3=CenterCoord(1,1)+(DimensionArea(1,1)/2);
    PosF4=CenterCoord(1,2)+(DimensionArea(1,2)/2);
    PosFX = [PosF1 PosF2];
    PosFY = [PosF3 PosF4];
    Draw_LinesToShow(PosFX,PosFY, TerrainColor);
end