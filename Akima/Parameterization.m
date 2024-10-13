function outputArray = Parameterization(Parray,lineLengths)
%累计弦长的平方根计算参数
%input  : inputArray   原始坐标数组
%retval : ouputArray   原始坐标参数化后的数组

% 初始化参数值
outputArray = zeros(size(Parray, 1),1);% size函数求得Parray的第一维度：行数dim1。Uarray是dim1行1列的矩阵

% 计算总长度
totalLength = sum(lineLengths);

%计算参数
outputArray(1) = 0;
for i = 2:length(outputArray)
    outputArray(i) = outputArray(i-1) + lineLengths(i-1)/totalLength;
end

end

