clear;

MaxSmoothError = 0.001;
  
P0 = [1,12];
P1 = [5,6];
P2 = [10,19];
P3 = [15,16];
P4 = [20,28];
P5 = [30,9];
P6 = [40,32];
P7 = [45,12];
P8 = [50,44];

P0 = [0,0.01];
P1 = [0.013,0.041];
P2 = [0.024,0.021];
P3 = [0.035,0.062];
P4 = [0.047,0.028];
P5 = [0.058,0.09];
P6 = [0.062,0.013];
P7 = [0.088,0.042];
P8 = [0.1,0.012];
%���������
Parray = [P0;P1;P2;P3;P4;P5;P6;P7;P8];

%�������ľ���
lineLengths= dot2dotDistance(Parray);

%�߶μ�ļн�
angleArr = lineAngle(Parray,lineLengths);

%�����߶νṹ��
line = struct( ...
          "start",{},...        %�߶���ʼ��
          "end",{},...          %�߶���ֹ��
          "length",{}, ...      %�߶γ���
          "angle",{}, ...       %�߶μн�
          "unitVector",{});   %�߶ε�����
      
%��ԭʼ������ľ��룬�����ڽṹ��line��
for i = 1 : length(Parray) - 1
    line(i).start       = Parray(i,:);
    line(i).end         = Parray(i+1,:);
    line(i).length      = lineLengths(i);
    line(i).angle       = angleArr(i);
    line(i).unitVector  = (line(i).end-line(i).start)/lineLengths(i);
end
  
%��������
plot(Parray(:,1),Parray(:,2),'k'); 
hold on;

%PH���߽ṹ�嶨��
ph = struct( ...
     "miu",{},...
     "k",{},...
     "d",{},...
     "lamda",{},...
     "D",{},...
     "u0",{},...
     "u2",{},...
     "v2",{},...
     "transLength",{},...
     "B",{});
 
ph = phParameter(ph,line,MaxSmoothError);

ph = phTransitionLength(ph,line);

ph = phCtrolPoint(ph,line);

h_ph = phSmooth(ph);
