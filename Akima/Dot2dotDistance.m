function outputArr = Dot2dotDistance(inputArr)
%DOT2DOTDISTANCE
%��������ľ���
%input  �������
%retval outputArr

%��ԭʼ������ľ��룬����������paramLengths��
outputArr = sqrt(sum((inputArr(2:end,:)-inputArr(1:end-1,:)).^2,2));

end

