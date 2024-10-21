function outputArray = b_parameterization(B_P_lengths)
%�ۼ��ҳ���ƽ�����������
%input  : inputArray   ԭʼ��������
%retval : ouputArray   ԭʼ����������������

% ��ʼ������ֵ
outputArray = zeros(5,1);

% �����ܳ���
totalLength = sum(B_P_lengths);

%�������
outputArray(1) = 0;
for i = 2:length(outputArray)
    outputArray(i) = outputArray(i-1) + B_P_lengths(i-1)/totalLength;
end

end

