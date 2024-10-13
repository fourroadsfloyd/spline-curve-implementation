function StructIn = ChordHeightError(angleArr,lineLengths,StructIn,MaxSmoothError)
%ChordHeightError  ����˫�Ҹ����׼����ÿ������ӹ������ݵ�
%input  : lineLengths  �����ľ������
%       : angleArr       �߶μ�нǾ���
%       : Parray         ԭʼ�����
%       : MaxSmoothError ����˳���
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

