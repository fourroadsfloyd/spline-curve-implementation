function bsplineSmooth(line)
%BSPLINESMOOTH �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
for i = 1:length(line)-1
    line(i).B_P_lengths = b_dot2dotDistance(line(i).B_P);
    line(i).B_P_u = b_parameterization(line(i).B_P_lengths);
end    
   
ctrlPointnum = 5;                   %���Ƶ����� 
nodeVector = [0,0,0,0,0.5,1,1,1,1]; %�ڵ�����
k = 3;                              %B��������
nik_u = zeros(100,ctrlPointnum);

curvePoint = zeros(1,2);
curvePoints= zeros(100,2);
u = linspace(0,1,100);

for i = 1:length(line)-1    
    for j = 1:100    
        for n = 1:ctrlPointnum
            nik_u(j,n) = baseFunction(n,k,u(j),nodeVector);
        end
        curvePoint = nik_u(j,:) * line(i).B_P;
        curvePoints(j,:) = curvePoint;
    end
    plot(curvePoints(:, 1), curvePoints(:, 2), '--r');
end
hold off;

end

