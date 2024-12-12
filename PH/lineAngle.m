function angleArr = lineAngle(Parray,dotLengths)
%LineAngle  AB,BC�ཻ��B�㣬���B
%input  : Parray     ��������
%       : dotLengths �����ľ������ 
%retval : angleArr �нǾ���

PtempArr1 = Parray(2:end,:)-Parray(1:end-1,:);
PtempArr2 = Parray(1:end-1,:)-Parray(2:end,:);

%��ʼ���н�����
angleArr = zeros(1,size(PtempArr1,1));

for i = 1:length(PtempArr1)-1
    x = (PtempArr1(i,1)*PtempArr2(i+1,1) + PtempArr1(i,2)*PtempArr2(i+1,2))/(dotLengths(i)*dotLengths(i+1));
    angleArr(i) = acos(x);
end

end

