function AkimaInterp(line)
%INTERP 此处显示有关此函数的摘要
%   此处显示详细说明
hold on;

for i = 1 : length(line)
    
    if all(line(i).flag == 1) 

            A = line(i).start;
            B = line(i).startslopeVector;
            C = (3*line(i).lineslopeVector-2*line(i).startslopeVector-line(i).endslopeVector)/(line(i).Uend-line(i).Ustart);
            D = ((-2)*line(i).lineslopeVector+line(i).startslopeVector+line(i).endslopeVector)/(line(i).Uend-line(i).Ustart)^2; 
           
            u = linspace(line(i).Ustart, line(i).Uend, 50);
            
            R = A'+B'*(u-line(i).Ustart)+C'*(u-line(i).Ustart).^2+D'*(u-line(i).Ustart).^3;
    
        
    end
     
    
    % 绘制样条曲线
    plot([line(i).start(1),line(i).end(1)],[line(i).start(2),line(i).end(2)],'r',R(1,:), R(2,:),'--g');   
 
end
    xlabel('x轴');
    ylabel('y轴');
    title('Akima');
    %legend('原始数据点', '样条曲线');

hold off;

end

