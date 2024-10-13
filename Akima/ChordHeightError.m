function StructIn = ChordHeightError(angleArr,lineLengths,StructIn,MaxSmoothError)
%ChordHeightError  利用双弦高误差准则，求得可连续加工的数据点
%input  : lineLengths  点与点的距离矩阵
%       : angleArr       线段间夹角矩阵
%       : Parray         原始坐标点
%       : MaxSmoothError 最大光顺误差
%retval : NULL

for i = 1:length(angleArr)-1
    centralAngle = atan2(lineLengths(i)*sin(pi-angleArr(i)),lineLengths(i+1)+lineLengths(i)*cos(pi-angleArr(i)));
    radius       = lineLengths(i)/2*sin(centralAngle);
    err1         = radius*(1-cos(centralAngle));
    err2         = radius*(1-cos(pi-angleArr(i)-centralAngle));
    if all(err1 < MaxSmoothError) && all(err2 < MaxSmoothError)
       StructIn(i).right=1;
    end
end

end

