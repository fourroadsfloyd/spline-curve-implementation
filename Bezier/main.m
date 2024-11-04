clear;

%最大轮廓误差
MaxSmoothError = 0.1; 

%最大加速度
Amax = 1000;

%插补周期
Ts = 0.01;

%误差分配-------------------------------
if MaxSmoothError >= Amax*Ts^2/4
    %弓高误差
    error_ch = Amax*Ts^2/8;
else
    error_ch = MaxSmoothError/2;
end

%拟合误差
error_ap = MaxSmoothError - error_ch;
%-------------------------------------

% 定义控制点
P0 = [1,12];
P1 = [5,6];
P2 = [10,19];
P3 = [15,16];
P4 = [20,28];
P5 = [30,9];
P6 = [32,25];
P7 = [40,32];
P8 = [45,12];
P9 = [50,44];

%原始坐标点数组
Parray = [P0;P1;P2;P3;P4;P5;P6;P7;P8;P9];

%求解点与点的距离
lineLengths= b_dot2dotDistance(Parray);

%线段间的夹角
angleArr = LineAngle(Parray,lineLengths);

%一个曲率连续的贝塞尔曲线，在曲率最大处将曲线分割，
%将原本6个控制点的贝塞尔曲线变成了两个带有四个控制点的贝塞尔曲线，同时，两个曲线共用转角的控制点

%定义线段结构体
line = struct( ...
          "start",{},...        %线段起始点
          "end",{},...          %线段终止点
          "length",{}, ...      %线段长度
          "angle",{}, ...       %线段夹角
          "vector",{},...
          "transLength",{},...  %贝塞尔样条过渡长度
          "Bezier_P",{});      %贝塞尔样条四个控制点
          
                 
%求原始坐标点间的距离，保存在结构体line中
for i = 1 : length(Parray) - 1
    line(i).start            = Parray(i,:);
    line(i).end              = Parray(i+1,:);
    line(i).length           = lineLengths(i);
    line(i).angle            = angleArr(i);
    line(i).vector           = zeros(1,2);
    line(i).transLength      = 4 * error_ap * csc((pi - line(i).angle)/2);
    line(i).Bezier_P         = zeros(8,2);
                  
end

%计算每条线段的两个方向的向量
line = lineVector(line);

%计算每条线段对应的贝塞尔曲线的控制点
line = contrlPoint(line);

%-------------------------------testing the b-spline contrlPoints' position in figure is true or false

hold on;
for i = 1:length(line)
    plot([line(i).start(1),line(i).end(1)],[line(i).start(2),line(i).end(2)],'x');
    for j = 1 : 8
        plot(line(i).Bezier_P(j,1),line(i).Bezier_P(j,2),'x');  
    end
    
end

%-------------------------------------------------------------------

%bezier曲线拟合
bezierSmooth(line);

hold off;

