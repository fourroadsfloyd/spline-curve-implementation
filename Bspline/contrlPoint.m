function line = contrlPoint(line)
%CONTRLPOINT �˴���ʾ�йش˺�����ժҪ
%����B�������Ƶ������

for i = 1:length(line)-1
    unitVectorX1 = (line(i).start(1)-line(i).end(1))/line(i).length; %B��������߶εĵ�λ������x����
    unitVectorY1 = (line(i).start(2)-line(i).end(2))/line(i).length; %B��������߶εĵ�λ������y����
    unitVectorX2 = (line(i+1).end(1)-line(i+1).start(1))/line(i+1).length; %B��������߶εĵ�λ������x����
    unitVectorY2 = (line(i+1).end(2)-line(i+1).start(2))/line(i+1).length; %B��������߶εĵ�λ������y����
    
    line(i).B_P(1,1) = line(i).end(1) + 1.5 * line(i).transLength * unitVectorX1;
    line(i).B_P(1,2) = line(i).end(2) + 1.5 * line(i).transLength * unitVectorY1;
    
    line(i).B_P(2,1) = line(i).end(1) +  line(i).transLength * unitVectorX1;
    line(i).B_P(2,2) = line(i).end(2) +  line(i).transLength * unitVectorY1;
    
    line(i).B_P(3,1) = line(i).end(1);
    line(i).B_P(3,2) = line(i).end(2);
    
    line(i).B_P(4,1) = line(i).end(1) +  line(i).transLength * unitVectorX2;
    line(i).B_P(4,2) = line(i).end(2) +  line(i).transLength * unitVectorY2;
    
    line(i).B_P(5,1) = line(i).end(1) + 1.5 * line(i).transLength * unitVectorX2;
    line(i).B_P(5,2) = line(i).end(2) + 1.5 * line(i).transLength * unitVectorY2;
                    
end

end

