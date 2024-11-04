function line = lineVector(line)
%LINEVECTOR 此处显示有关此函数的摘要
%   此处显示详细说明

for i=1:length(line)
    line(i).vector(1,:) = (line(i).end - line(i).start) / line(i).length;    %start指向end
end

end

