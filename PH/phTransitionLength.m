function ph = phTransitionLength(ph,line)
%PHCONTRLPOINT 此处显示有关此函数的摘要
% 计算ph曲线的过渡长度

for i = 1:length(line)-1
    if i == 1
        a = ph(i).k;
        b = line(i).length;
        c = line(i+1).length / 2;
    
        if a < b
           min = a;
        else
           min = b;
        end
        if c < min
            min = c;
        end
        
    elseif i == length(line)-1 
        a = ph(i).k;
        b = line(i).length / 2;
        c = line(i+1).length;

        if a < b
           min = a;
        else
           min = b;
        end
        if c < min
            min = c;
        end
        
    else
        a = ph(i).k;
        b = line(i).length / 2;
        c = line(i+1).length / 2;

        if a < b
           min = a;
        else
           min = b;
        end
        if c < min
            min = c;
        end
        
    end
    
    ph(i).transLength = min;
end

end

