function outputArr = Dot2dotDistance(inputArr)
%DOT2DOTDISTANCE
%求坐标点间的距离
%input  坐标矩阵
%retval outputArr

%求原始坐标点间的距离，保存在数组paramLengths中
outputArr = sqrt(sum((inputArr(2:end,:)-inputArr(1:end-1,:)).^2,2));

end

