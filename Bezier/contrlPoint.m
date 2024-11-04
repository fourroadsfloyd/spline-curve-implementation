function line = contrlPoint(line)
%CONTRLPOINT �˴���ʾ�йش˺�����ժҪ
%����B�������Ƶ������

for i = 1:length(line)-1
                                                        
    line(i).Bezier_P(1,:) = line(i).end - line(i).transLength * line(i).vector(1,:); 
    line(i).Bezier_P(2,:) = line(i).end - 0.5 * line(i).transLength * line(i).vector(1,:);
    line(i).Bezier_P(3,:) = line(i).end - 0.25 * line(i).transLength * line(i).vector(1,:);
    line(i).Bezier_P(4,:) = line(i).end + 0.125 * line(i).transLength * (line(i+1).vector(1,:)-line(i).vector(1,:));
    
    line(i).Bezier_P(5,:) = line(i).end + 0.125 * line(i).transLength * (line(i+1).vector(1,:)-line(i).vector(1,:));
    line(i).Bezier_P(6,:) = line(i).end + 0.25 * line(i).transLength * line(i+1).vector(1,:); 
    line(i).Bezier_P(7,:) = line(i).end + 0.5 * line(i).transLength * line(i+1).vector(1,:);
    line(i).Bezier_P(8,:) = line(i).end + line(i).transLength * line(i+1).vector(1,:); 
                    
end

end

