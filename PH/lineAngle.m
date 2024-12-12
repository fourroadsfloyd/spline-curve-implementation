function angleArr = lineAngle(Parray,dotLengths)
%LineAngle  AB,BC相交于B点，求角B
%input  : Parray     坐标点矩阵
%       : dotLengths 点与点的距离矩阵 
%retval : angleArr 夹角矩阵

PtempArr1 = Parray(2:end,:)-Parray(1:end-1,:);
PtempArr2 = Parray(1:end-1,:)-Parray(2:end,:);

%初始化夹角数组
angleArr = zeros(1,size(PtempArr1,1));

for i = 1:length(PtempArr1)-1
    x = (PtempArr1(i,1)*PtempArr2(i+1,1) + PtempArr1(i,2)*PtempArr2(i+1,2))/(dotLengths(i)*dotLengths(i+1));
    angleArr(i) = acos(x);
end

end

