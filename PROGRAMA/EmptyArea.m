function AreaSobra=EmptyArea(cp,Xmax,Ymax,cuts)

AreaUsed = (Xmax-1)*Ymax;

AreaPiezas = TotalArea(cuts);

AreaSobra= AreaUsed - AreaPiezas;

end