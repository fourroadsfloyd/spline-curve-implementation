function line = transitionLength(line,MaxSmoothError)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

for i = 1 : length(line)-1
    a = 2*MaxSmoothError / cosd(line(i).angle/2);
    b = line(i).length / 6;
    c = line(i+1).length / 6;
    
    if a < b
       min = a;
    else
       min = b;
    end
    if c < min
        min = c;
    end
    
    line(i).transLength = min;
   
end

line(length(line)).transLength=0; %保持数据完整性

end

