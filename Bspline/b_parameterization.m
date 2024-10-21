function outputArray = b_parameterization(B_P_lengths)
%累计弦长的平方根计算参数
%input  : inputArray   原始坐标数组
%retval : ouputArray   原始坐标参数化后的数组

% 初始化参数值
outputArray = zeros(5,1);

% 计算总长度
totalLength = sum(B_P_lengths);

%计算参数
outputArray(1) = 0;
for i = 2:length(outputArray)
    outputArray(i) = outputArray(i-1) + B_P_lengths(i-1)/totalLength;
end

end

