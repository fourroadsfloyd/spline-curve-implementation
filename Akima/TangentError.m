function StructIn = TangentError(StructIn,MaxSmoothError)
%TangentError(line,MaxSmoothError)
%«–œﬂŒÛ≤Ó≤‚ ‘
%input  :line  
%       :MaxSmoothError
%output :NULL

for i = 1:length(StructIn)-1
    if all(StructIn(i).right == 1)
        X1 = 1/(StructIn(i).startslope+StructIn(i).endslope)*(StructIn(i).startslope*StructIn(i).start(1)+StructIn(i).end(2)-StructIn(i).endslope*StructIn(i).end(1)-StructIn(i).start(2));
        Y1 = StructIn(i).start(2)+StructIn(i).startslope*(X1 - StructIn(i).start(1));
        d1 = abs(StructIn(i).lineslope * X1 - StructIn(i).lineslope * StructIn(i).start(1) + StructIn(i).start(2) - Y1) / sqrt(StructIn(i).lineslope^2+1);
        X2 = 1/(StructIn(i+1).startslope+StructIn(i+1).endslope)*(StructIn(i+1).startslope*StructIn(i+1).start(1)+StructIn(i+1).end(2)-StructIn(i+1).endslope*StructIn(i+1).end(1)-StructIn(i+1).start(2));
        Y2 = StructIn(i+1).start(2)+StructIn(i+1).startslope*(X2 - StructIn(i+1).start(1));
        d2 = abs(StructIn(i+1).lineslope * X2 - StructIn(i+1).lineslope * StructIn(i+1).start(1) + StructIn(i+1).start(2) - Y2) / sqrt(StructIn(i+1).lineslope^2+1);
        if all(d1<MaxSmoothError) && all(d2<MaxSmoothError)
           StructIn(i).flag = 1; 
           StructIn(i+1).flag = 1;
        end
    end
end

end
