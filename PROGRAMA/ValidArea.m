function Validacion = ValidArea(Dimensions, CenterCoord, DimensionArea)
    if (CenterCoord(1,1)+(DimensionArea(1,1)/2) > Dimensions(1,1)) || (CenterCoord(1,2)+(DimensionArea(1,2)/2) > Dimensions(1,2))
        Validacion = 0;
    elseif (CenterCoord(1,1)-(DimensionArea(1,1)/2) < 0) || (CenterCoord(1,2)-(DimensionArea(1,2)/2) < 0)
        Validacion = 0;
    else
        Validacion = 1;
    end
end