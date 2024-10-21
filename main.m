clear;

%最大轮廓误差
MaxSmoothError = 1000; 

% 定义控制点
P0 = [1,12];
P1 = [5,6];
P2 = [10,19];
P3 = [15,16];
P4 = [20,28];
P5 = [30,9];
P6 = [35,16];
P7 = [40,32];
P8 = [45,12];
P9 = [50,44];

%原始坐标点数组
Parray = [P0;P1;P2;P3;P4;P5;P6;P7;P8;P9];

%求解点与点的距离
lineLengths= b_dot2dotDistance(Parray);

%线段间的夹角
angleArr = LineAngle(Parray,lineLengths);

%定义线段结构体
line = struct( ...
          "start",{},...        %线段起始点
          "end",{},...          %线段终止点
          "length",{}, ...      %线段长度
          "angle",{}, ...       %线段夹角
          "transLength",{},...  %B样条过渡长度
          "B_P",{},...          %B样条五个控制点
          "B_P_lengths",{},...  %样条控制点间的距离
          "B_P_u",{});          %B样条五个控制点的参数
         
          
%求原始坐标点间的距离，保存在结构体line中
for i = 1 : length(Parray) - 1
    line(i).start       = Parray(i,:);
    line(i).end         = Parray(i+1,:);
    line(i).length      = lineLengths(i);
    line(i).angle       = angleArr(i);
    line(i).B_P         = zeros(5,2);
    line(i).B_P_lengths = zeros(4,1);
    line(i).B_P_u       = zeros(5,1);
end

%计算B样条的过渡长度
line = transitionLength(line,MaxSmoothError);

%计算B样条的控制点坐标
line = contrlPoint(line);

%-------------------------------testing the b-spline contrlPoints' position in figure is true or false

hold on;
for i = 1:length(line)
    plot([line(i).start(1),line(i).end(1)],[line(i).start(2),line(i).end(2)],'g');
    for j = 1 : 5
        plot(line(i).B_P(j,1),line(i).B_P(j,2),'x');  
    end
    
end

%-------------------------------------------------------------------

%插补B样条
bsplineSmooth(line);












