function line = contrlPoint(line)
%CONTRLPOINT 此处显示有关此函数的摘要
%计算B样条控制点的坐标

for i = 1:length(line)-1
    unitVectorX1 = (line(i).start(1)-line(i).end(1))/line(i).length; %B样条左侧线段的单位向量的x分量
    unitVectorY1 = (line(i).start(2)-line(i).end(2))/line(i).length; %B样条左侧线段的单位向量的y分量
    unitVectorX2 = (line(i+1).end(1)-line(i+1).start(1))/line(i+1).length; %B样条左侧线段的单位向量的x分量
    unitVectorY2 = (line(i+1).end(2)-line(i+1).start(2))/line(i+1).length; %B样条左侧线段的单位向量的y分量
    
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

