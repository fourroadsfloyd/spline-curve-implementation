function outputArray = Parameterization(Parray,lineLengths)
%�ۼ��ҳ���ƽ�����������
%input  : inputArray   ԭʼ��������
%retval : ouputArray   ԭʼ����������������

% ��ʼ������ֵ
outputArray = zeros(size(Parray, 1),1);% size�������Parray�ĵ�һά�ȣ�����dim1��Uarray��dim1��1�еľ���

% �����ܳ���
totalLength = sum(lineLengths);

%�������
outputArray(1) = 0;
for i = 2:length(outputArray)
    outputArray(i) = outputArray(i-1) + lineLengths(i-1)/totalLength;
end

end

