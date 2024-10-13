%��ɢ�����Akima��ϵ�������

%����������
MaxSmoothError = 1000; 

line = struct(...
        "start",{},...      %��ʼ��
        "end",{},...        %��ֹ��
        "Ustart",{},...
        "Uend",{},...
        "length",{},...     %����
        "right",{},...      %˫�Ҹ�������
        "flag",{},...       %����������
        "lineslpoe",{},...  %�߶�б��
        "startslopeVector",{},... %������㷨�õ���ÿ���߶���ʼ��б������  
        "endslopeVector",{}, ...  %������㷨�õ���ÿ���߶���ֹ��б������
        "startslope",{}, ...      %������㷨�õ���ÿ���߶���ʼ��б��
        "endslope",{});           %������㷨�õ���ÿ���߶���ֹ��б��
%{
P0 = [0,0.01];
P1 = [0.013,0.041];
P2 = [0.024,0.021];
P3 = [0.035,0.062];
P4 = [0.047,0.028];
P5 = [0.058,0.09];
P6 = [0.062,0.013];
P7 = [0.088,0.042];
P8 = [0.1,0.012];
P9 = [0.16,0.084];
%}
    
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

%��ԭʼ������ľ��룬����������lineLengths��
lineLengths = Dot2dotDistance(Parray);

%�������������
Uarray = Parameterization(Parray,lineLengths);

%������㷨�õ���ÿ����б��
[slope,slopeVector] = FiveAkima(Parray,Uarray);

%�߶ε���ʼ��
start = Parray(1:end-1,:);
%�߶εĽ�����
End   = Parray(2:end,:);
   
for i = 1:length(Parray)-1
    line(i).start            = start(i,:);
    line(i).end              = End(i,:);
    line(i).Ustart           = Uarray(i);
    line(i).Uend             = Uarray(i+1);
    line(i).length           = lineLengths(i);
    line(i).right            = 0;
    line(i).flag             = 0;
    line(i).lineslope        = (line(i).start(2)-line(i).end(2)) / (line(i).start(1)-line(i).end(1));
    line(i).startslopeVector = slope(i,:);
    line(i).endslopeVector   = slope(i+1,:);
    line(i).startslope       = line(i).startslopeVector(2)/line(i).startslopeVector(1);
    line(i).endslope         = line(i).endslopeVector(2)/line(i).endslopeVector(1);
end


%�����߶μ�ļн�
angleArr = LineAngle(Parray,lineLengths);

%����˫�Ҹ����׼���ж�
line = ChordHeightError(angleArr,lineLengths,line,MaxSmoothError);

%��������������
line = TangentError(line,MaxSmoothError);

%��Akima���ʽ�е�ϵ��A,B,C,D,���������
AkimaInterp(slopeVector,line,Uarray,Parray);



