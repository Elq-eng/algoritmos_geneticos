function lines=Part2line(part)

lineA=create_line(0,[part.A(1,1) part.B(1,1)],part.A(1,2));
lineB=create_line(1,[part.B(1,2) part.C(1,2)],part.B(1,1));
lineC=create_line(0,[part.C(1,1) part.D(1,1)],part.C(1,2));
lineD=create_line(1,[part.D(1,2) part.A(1,2)],part.D(1,1));

lines=[lineA lineB lineC lineD];