function out=Inranges(range1,range2)

out=(range1(1,1)>=range2(1,1)&&range1(1,1)<range2(1,2))||...
    (range1(1,2)>range2(1,1)&&range1(1,2)<=range2(1,2));
  