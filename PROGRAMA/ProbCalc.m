function probabilidad=ProbCalc(pob,pos)

X=0;
A=0;
B=0;
C=0;
probabilidad=0;

A=pob(1).fitness;
C=pob(size(pob)).fitness;
B=C;

probabilidad=(2*(pob(pos).fitness-A))/((B-A)*(C-A));

end