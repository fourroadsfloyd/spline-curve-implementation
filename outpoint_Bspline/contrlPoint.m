function line = contrlPoint(line)
%CONTRLPOINT 此处显示有关此函数的摘要
%计算B样条控制点的坐标

for i = 1:length(line)-1
    unitVectorX1 = (line(i).start(1)-line(i).end(1))/line(i).length; %B样条左侧线段的单位向量的x分量
    unitVectorY1 = (line(i).start(2)-line(i).end(2))/line(i).length; %B样条左侧线段的单位向量的y分量
    
    unitVectorX2 = (line(i+1).end(1)-line(i+1).start(1))/line(i+1).length; %B样条左侧线段的单位向量的x分量
    unitVectorY2 = (line(i+1).end(2)-line(i+1).start(2))/line(i+1).length; %B样条左侧线段的单位向量的y分量
    %{
    unitVectorX3 = cosd((line(i).pangle-line(i).langle)/2) / unitVectorX1;
    unitVectorY3 = cosd((line(i).pangle-line(i).langle)/2) / unitVectorY1;
    
    unitVectorX4 = cosd((line(i).pangle-line(i).langle)/2) / unitVectorX2;
    unitVectorY4 = cosd((line(i).pangle-line(i).langle)/2) / unitVectorY2;
    %}
    if (unitVectorX1 * unitVectorY2 - unitVectorX2 * unitVectorY1) < 0
        unitVectorX3 = unitVectorX1 * cosd((line(i).pangle - line(i).langle)/2)... 
                        - unitVectorY1 * sind((line(i).pangle - line(i).langle)/2);
        unitVectorY3 = unitVectorX1 * sind((line(i).pangle - line(i).langle)/2)...
                        + unitVectorY1 * cosd((line(i).pangle - line(i).langle)/2);

        unitVectorX4 = unitVectorX2 * cosd((line(i).pangle - line(i).langle)/2)...
                        + unitVectorY2 * sind((line(i).pangle - line(i).langle)/2);
        unitVectorY4 = -1 * unitVectorX2 * sind((line(i).pangle - line(i).langle)/2)...
                        + unitVectorY2 * cosd((line(i).pangle - line(i).langle)/2);
    else
        unitVectorX3 = unitVectorX1 * cosd((line(i).pangle - line(i).langle)/2)... 
                        + unitVectorY1 * sind((line(i).pangle - line(i).langle)/2);
        unitVectorY3 = -1 * unitVectorX1 * sind((line(i).pangle - line(i).langle)/2)...
                        + unitVectorY1 * cosd((line(i).pangle - line(i).langle)/2);

        unitVectorX4 = unitVectorX2 * cosd((line(i).pangle - line(i).langle)/2)...
                        - unitVectorY2 * sind((line(i).pangle - line(i).langle)/2);
        unitVectorY4 = unitVectorX2 * sind((line(i).pangle - line(i).langle)/2)...
                        + unitVectorY2 * cosd((line(i).pangle - line(i).langle)/2);
    end
    
    %p1
    line(i).B_P(1,1) = line(i).end(1) + line(i).transLength * unitVectorX1;
    line(i).B_P(1,2) = line(i).end(2) + line(i).transLength * unitVectorY1;
    
    %p2
    line(i).B_P(2,1) = line(i).end(1) + line(i).transLength / 5 * 4 * unitVectorX1;
    line(i).B_P(2,2) = line(i).end(2) + line(i).transLength / 5 * 4 * unitVectorY1;
    
    %p3
    line(i).B_P(3,1) = line(i).end(1) + line(i).transLength / 5 * 2 * unitVectorX1;
    line(i).B_P(3,2) = line(i).end(2) + line(i).transLength / 5 * 2 * unitVectorY1;
    
    %p4
    line(i).B_P(4,1) = line(i).end(1) + line(i).transLength / 5 * unitVectorX3;
    line(i).B_P(4,2) = line(i).end(2) + line(i).transLength / 5 * unitVectorY3;
     
    %p5
    line(i).B_P(5,1) = line(i).end(1);
    line(i).B_P(5,2) = line(i).end(2);
    
    %p6
    line(i).B_P(6,1) = line(i).end(1) + line(i).transLength / 5 * unitVectorX4;
    line(i).B_P(6,2) = line(i).end(2) + line(i).transLength / 5 * unitVectorY4;
    
    %p7
    line(i).B_P(7,1) = line(i).end(1) + line(i).transLength / 5 * 2 * unitVectorX2;
    line(i).B_P(7,2) = line(i).end(2) + line(i).transLength / 5 * 2 * unitVectorY2;
    
    %p8
    line(i).B_P(8,1) = line(i).end(1) + line(i).transLength / 5 * 4 * unitVectorX2;
    line(i).B_P(8,2) = line(i).end(2) + line(i).transLength / 5 * 4 * unitVectorY2;
    
    %p9
    line(i).B_P(9,1) = line(i).end(1) + line(i).transLength * unitVectorX2;
    line(i).B_P(9,2) = line(i).end(2) + line(i).transLength * unitVectorY2;
  
end

end

