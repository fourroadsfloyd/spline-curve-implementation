function bezierSmooth(line)
%BEZIERINTERP 此处显示有关此函数的摘要
%   此处显示详细说明

u = linspace(0,1,100);

for i = 1:length(line)
    if i==1
        %line
        P = line(i).start + line(i).transLength' .* line(i).vector + u' .* (line(i).length ...
            - line(i).transLength) .* line(i).vector;
        plot(P(:,1),P(:,2),'-g');
        
        %f
        P = line(i).end - 0.125 .* line(i).transLength .* (2 - u').^3 .* line(i).vector + 0.125 .* line(i).transLength ...
            .* u'.^3 .* line(i+1).vector;
        plot(P(:,1),P(:,2),'-r');
    end
    
    if i == length(line)
        %line
        P = line(i).start + line(i).transLength' .* line(i).vector ...
            + u' .* (line(i).length - line(i).transLength) .* line(i).vector;
        plot(P(:,1),P(:,2),'-g');
        
        %s
        P = line(i-1).end - 0.125 .* line(i-1).transLength .* (1 - u').^3 .* line(i-1).vector + 0.125 .* line(i-1).transLength ...
            .* (1 + u').^3 .* line(i).vector;
        plot(P(:,1),P(:,2),'-r');
    end
    
    if i>=2 && i<length(line)
        %s
        P = line(i-1).end - 0.125 .* line(i-1).transLength .* (1 - u').^3 .* line(i-1).vector + 0.125 .* line(i-1).transLength ...
            .* (1 + u').^3 .* line(i).vector;
        plot(P(:,1),P(:,2),'-r');
        
        %line
        P = line(i).start + line(i).transLength' .* line(i).vector + u' .* (line(i).length ...
            - line(i+1).transLength - line(i).transLength) .* line(i).vector;
        plot(P(:,1),P(:,2),'-g');
        
        %f
        P = line(i).end - 0.125 .* line(i).transLength .* (2 - u').^3 .* line(i).vector + 0.125 .* line(i).transLength ...
            .* u'.^3 .* line(i+1).vector;
        plot(P(:,1),P(:,2),'-r');
    end
       
    
end

end

