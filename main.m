clear;

%����������
MaxSmoothError = 1000; 

% ������Ƶ�
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

%ԭʼ���������
Parray = [P0;P1;P2;P3;P4;P5;P6;P7;P8;P9];

%�������ľ���
lineLengths= b_dot2dotDistance(Parray);

%�߶μ�ļн�
angleArr = LineAngle(Parray,lineLengths);

%�����߶νṹ��
line = struct( ...
          "start",{},...        %�߶���ʼ��
          "end",{},...          %�߶���ֹ��
          "length",{}, ...      %�߶γ���
          "angle",{}, ...       %�߶μн�
          "transLength",{},...  %B�������ɳ���
          "B_P",{},...          %B����������Ƶ�
          "B_P_lengths",{},...  %�������Ƶ��ľ���
          "B_P_u",{});          %B����������Ƶ�Ĳ���
         
          
%��ԭʼ������ľ��룬�����ڽṹ��line��
for i = 1 : length(Parray) - 1
    line(i).start       = Parray(i,:);
    line(i).end         = Parray(i+1,:);
    line(i).length      = lineLengths(i);
    line(i).angle       = angleArr(i);
    line(i).B_P         = zeros(5,2);
    line(i).B_P_lengths = zeros(4,1);
    line(i).B_P_u       = zeros(5,1);
end

%����B�����Ĺ��ɳ���
line = transitionLength(line,MaxSmoothError);

%����B�����Ŀ��Ƶ�����
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

%�岹B����
bsplineSmooth(line);












