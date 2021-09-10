function [pobIni, pobSel, pobCru, pobMutOrdered, best_Ind] = AdjustParameters(pobIni, pobSel, pobCru, pobMutOrdered, best_Ind, xIni, yIni)
    SPI = size(pobIni);
    for il = 1:SPI(1,1)
       cp = pobIni(il,1).gen;
       for de = 1:size(cp,1)
           cp(de,3)= (cp(de,3)+xIni);
           cp(de,4)= (cp(de,4)+yIni);
           cp(de,5)= (cp(de,5)+xIni);
           cp(de,6)= (cp(de,6)+yIni);
           cp(de,7)= (cp(de,7)+xIni);
           cp(de,8)= (cp(de,8)+yIni);
           cp(de,9)= (cp(de,9)+xIni);
           cp(de,10)= (cp(de,10)+yIni);
       end
       pobIni(il,1).gen = cp;
    end
    
    SPS = size(pobSel);
    for il1 = 1:SPS(1,1)
       cp1 = pobSel(il1,1).gen;
       for de1 = 1:size(cp1,1)
           cp1(de1,3)= (cp1(de1,3)+xIni);
           cp1(de1,4)= (cp1(de1,4)+yIni);
           cp1(de1,5)= (cp1(de1,5)+xIni);
           cp1(de1,6)= (cp1(de1,6)+yIni);
           cp1(de1,7)= (cp1(de1,7)+xIni);
           cp1(de1,8)= (cp1(de1,8)+yIni);
           cp1(de1,9)= (cp1(de1,9)+xIni);
           cp1(de1,10)= (cp1(de1,10)+yIni);
       end
       pobSel(il1,1).gen = cp1;
    end
    
    SPC = size(pobCru);
    for il2 = 1:SPC(1,1)
       cp2 = pobCru(il2,1).gen;
       for de2 = 1:size(cp2,1)
           cp2(de2,3)= (cp2(de2,3)+xIni);
           cp2(de2,4)= (cp2(de2,4)+yIni);
           cp2(de2,5)= (cp2(de2,5)+xIni);
           cp2(de2,6)= (cp2(de2,6)+yIni);
           cp2(de2,7)= (cp2(de2,7)+xIni);
           cp2(de2,8)= (cp2(de2,8)+yIni);
           cp2(de2,9)= (cp2(de2,9)+xIni);
           cp2(de2,10)= (cp2(de2,10)+yIni);
       end
       pobCru(il2,1).gen = cp2;
    end
    
    SPM = size(pobMutOrdered);
    for il3 = 1:SPM(1,1)
       cp3 = pobMutOrdered(il3,1).gen;
       for de3 = 1:size(cp3,1)
           cp3(de3,3)= (cp3(de3,3)+xIni);
           cp3(de3,4)= (cp3(de3,4)+yIni);
           cp3(de3,5)= (cp3(de3,5)+xIni);
           cp3(de3,6)= (cp3(de3,6)+yIni);
           cp3(de3,7)= (cp3(de3,7)+xIni);
           cp3(de3,8)= (cp3(de3,8)+yIni);
           cp3(de3,9)= (cp3(de3,9)+xIni);
           cp3(de3,10)= (cp3(de3,10)+yIni);
       end
       pobMutOrdered(il3,1).gen = cp3;
    end
    
    SPB = size(best_Ind);
    for il4 = 1:SPB(1,1)
       cp4 = best_Ind(il4,1).gen;
       for de4 = 1:size(cp4,1)
           cp4(de4,3)= (cp4(de4,3)+xIni);
           cp4(de4,4)= (cp4(de4,4)+yIni);
           cp4(de4,5)= (cp4(de4,5)+xIni);
           cp4(de4,6)= (cp4(de4,6)+yIni);
           cp4(de4,7)= (cp4(de4,7)+xIni);
           cp4(de4,8)= (cp4(de4,8)+yIni);
           cp4(de4,9)= (cp4(de4,9)+xIni);
           cp4(de4,10)= (cp4(de4,10)+yIni);
       end
       best_Ind(il4,1).gen = cp4;
    end
end