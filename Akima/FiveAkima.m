function [slope,slopeVector] = FiveAkima(Parray,Uarray)
%五点Akima算法
%input  : Parray   原始坐标数组
%       : Uarray   参数化后的数组
%retval 
%slope            点的斜率矩阵
%slopeVector      线段斜率的分向量矩阵
%vectorLengths    斜率向量间的模

PtempArr = Parray(2:end,:)-Parray(1:end-1,:);
UtempArr = Uarray(2:end,:)-Uarray(1:end-1,:);

%构建斜率向量x轴，y轴的分量矩阵
slopeVector = zeros(size(PtempArr));
for i = 1:size(PtempArr, 1)
    slopeVector(i, :) = PtempArr(i, :) ./ UtempArr(i, :);
end

%将开始点和结束点的四个斜率向量添加到斜率向量x轴，y轴的分量矩阵中
slopeVector = vertcat(2*slopeVector(1,:)-slopeVector(2,:),slopeVector(1:end,:));
slopeVector = vertcat(2*slopeVector(1,:)-slopeVector(2,:),slopeVector(1:end,:));
slopeVector = vertcat(slopeVector(1:end,:),2*slopeVector(end-1,:)-slopeVector(end-2,:));
slopeVector = vertcat(slopeVector(1:end,:),2*slopeVector(end-1,:)-slopeVector(end-2,:));

%向量间的模
vectorLengths = sqrt((slopeVector(2:end,1)-slopeVector(1:end-1,1)).^2+(slopeVector(2:end,2)-slopeVector(1:end-1,2)).^2);

%初始化斜率向量矩阵，有几个点就有几个矩阵
slope = zeros(size(Parray));

for i = 3 : length(slopeVector)-1
    if all((slopeVector(i+1,:)==slopeVector(i,:))) && all((slopeVector(i-1,:)==slopeVector(i-2,:)))
        slope(i-2,:) = (slopeVector(i,:)+slopeVector(i-1,:))/2;
    else
        slope(i-2,:) = (vectorLengths(i) .* slopeVector(i-1,:) + vectorLengths(i-2) .* slopeVector(i,:)) ./ (vectorLengths(i) + vectorLengths(i-2));
    end
end

end

