clear;

%����������
MaxSmoothError = 0.1; 

%�����ٶ�
Amax = 1000;

%�岹����
Ts = 0.01;

%������-------------------------------
if MaxSmoothError >= Amax*Ts^2/4
    %�������
    error_ch = Amax*Ts^2/8;
else
    error_ch = MaxSmoothError/2;
end

%������
error_ap = MaxSmoothError - error_ch;
%-------------------------------------

% ������Ƶ�
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

%ԭʼ���������
Parray = [P0;P1;P2;P3;P4;P5;P6;P7;P8;P9];

%�������ľ���
lineLengths= b_dot2dotDistance(Parray);

%�߶μ�ļн�
angleArr = LineAngle(Parray,lineLengths);

%һ�����������ı��������ߣ���������󴦽����߷ָ
%��ԭ��6�����Ƶ�ı��������߱�������������ĸ����Ƶ�ı��������ߣ�ͬʱ���������߹���ת�ǵĿ��Ƶ�

%�����߶νṹ��
line = struct( ...
          "start",{},...        %�߶���ʼ��
          "end",{},...          %�߶���ֹ��
          "length",{}, ...      %�߶γ���
          "angle",{}, ...       %�߶μн�
          "vector",{},...
          "transLength",{},...  %�������������ɳ���
          "Bezier_P",{});      %�����������ĸ����Ƶ�
          
                 
%��ԭʼ������ľ��룬�����ڽṹ��line��
for i = 1 : length(Parray) - 1
    line(i).start            = Parray(i,:);
    line(i).end              = Parray(i+1,:);
    line(i).length           = lineLengths(i);
    line(i).angle            = angleArr(i);
    line(i).vector           = zeros(1,2);
    line(i).transLength      = 4 * error_ap * csc((pi - line(i).angle)/2);
    line(i).Bezier_P         = zeros(8,2);
                  
end

%����ÿ���߶ε��������������
line = lineVector(line);

%����ÿ���߶ζ�Ӧ�ı��������ߵĿ��Ƶ�
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

%bezier�������
bezierSmooth(line);

hold off;

