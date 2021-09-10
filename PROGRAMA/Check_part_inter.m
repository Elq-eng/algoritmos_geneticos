function out=Check_part_inter(part1,part2)

lines1=Part2line(part1);
lines2=Part2line(part2);
out=0;
for i=1:size(lines1,2)
    for j=1:size(lines2,2)
        out=Check_line_inter(lines1(1,i),lines2(1,j));
        if out
            break;
        end
    end
    if out
        break;
    end
end
if out
    
else
    out=Inranges(lines1(1,1).range,lines2(1,1).range)&&...
        Inranges(lines1(1,2).range,lines2(1,2).range);
end