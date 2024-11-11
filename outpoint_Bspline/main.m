clear

%����������
MaxSmoothError = 10; 

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
          "langle",{}, ...      %�߶μн�
          "pangle",{}, ...      %��4����6�����Ƶ�ļн�
          "transLength",{},...  %B�������ɳ���
          "B_P",{});            %B����9�����Ƶ�
         
          
%��ԭʼ������ľ��룬�����ڽṹ��line��
for i = 1 : length(Parray) - 1
    line(i).start       = Parray(i,:);
    line(i).end         = Parray(i+1,:);
    line(i).length      = lineLengths(i);
    line(i).langle      = angleArr(i);
    line(i).B_P         = zeros(9,2);
    line(i).transLength = zeros(8,1);
end

%����46�н�
for i = 1 : length(line) - 1
    line(i).pangle = 2 * atand((1/3+sind(angleArr(i)/2)) / cosd(angleArr(i)/2));
end

%����B�����Ĺ��ɳ���
line = transitionLength(line,MaxSmoothError);

%����B�����Ŀ��Ƶ�����
line = contrlPoint(line);

%-------------------------------testing the b-spline contrlPoints' position in figure is true or false

hold on;
for i = 1:length(line)
    plot([line(i).start(1),line(i).end(1)],[line(i).start(2),line(i).end(2)],'g');
    for j = 1 : 9
        plot(line(i).B_P(j,1),line(i).B_P(j,2),'x');  
    end
    
end

%-------------------------------------------------------------------

%�岹B����
bsplineSmooth(line);

   













