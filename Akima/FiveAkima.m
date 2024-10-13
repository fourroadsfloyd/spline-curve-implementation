function [slope,slopeVector] = FiveAkima(Parray,Uarray)
%���Akima�㷨
%input  : Parray   ԭʼ��������
%       : Uarray   �������������
%retval 
%slope            ���б�ʾ���
%slopeVector      �߶�б�ʵķ���������
%vectorLengths    б���������ģ

PtempArr = Parray(2:end,:)-Parray(1:end-1,:);
UtempArr = Uarray(2:end,:)-Uarray(1:end-1,:);

%����б������x�ᣬy��ķ�������
slopeVector = zeros(size(PtempArr));
for i = 1:size(PtempArr, 1)
    slopeVector(i, :) = PtempArr(i, :) ./ UtempArr(i, :);
end

%����ʼ��ͽ�������ĸ�б��������ӵ�б������x�ᣬy��ķ���������
slopeVector = vertcat(2*slopeVector(1,:)-slopeVector(2,:),slopeVector(1:end,:));
slopeVector = vertcat(2*slopeVector(1,:)-slopeVector(2,:),slopeVector(1:end,:));
slopeVector = vertcat(slopeVector(1:end,:),2*slopeVector(end-1,:)-slopeVector(end-2,:));
slopeVector = vertcat(slopeVector(1:end,:),2*slopeVector(end-1,:)-slopeVector(end-2,:));

%�������ģ
vectorLengths = sqrt((slopeVector(2:end,1)-slopeVector(1:end-1,1)).^2+(slopeVector(2:end,2)-slopeVector(1:end-1,2)).^2);

%��ʼ��б�����������м�������м�������
slope = zeros(size(Parray));

for i = 3 : length(slopeVector)-1
    if all((slopeVector(i+1,:)==slopeVector(i,:))) && all((slopeVector(i-1,:)==slopeVector(i-2,:)))
        slope(i-2,:) = (slopeVector(i,:)+slopeVector(i-1,:))/2;
    else
        slope(i-2,:) = (vectorLengths(i) .* slopeVector(i-1,:) + vectorLengths(i-2) .* slopeVector(i,:)) ./ (vectorLengths(i) + vectorLengths(i-2));
    end
end

end

