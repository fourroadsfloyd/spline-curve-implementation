function bsplineSmooth(line)
%BSPLINESMOOTH �˴���ʾ�йش˺�����ժҪ
%���޸Ĳ���
%ctrlPointnum  ���Ƶ�����
%nodeVector    �ڵ�����
%k             B��������

%---------------���޸�-----------------------------
ctrlPointnum = 9;                   %���Ƶ����� 
nodeVector = [0,0,0,0,0,0.25,0.5,0.5,0.75,1,1,1,1,1]; %�ڵ�����
k = 4;                              %B��������
%--------------------------------------------------

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

j = zeros(1,n);

for n = 1:ctrlPointnum
      j(1,n)= baseFunction(n,k,0.5,nodeVector);
end
hold off;

end

