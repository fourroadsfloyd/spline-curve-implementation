function ph = phCtrolPoint(ph,line)
%PHCTROLPOINT 此处显示有关此函数的摘要
%   此处显示详细说明

for i = 1:length(line)-1
    T = line(i).unitVector;
    J = T(1) * line(i+1).unitVector(2) - T(2) * line(i+1).unitVector(1);
    if J > 0
        N = [-T(2),T(1)];
    else
        N = [T(2),-T(1)];
    end
    ph(i).B(1,:) = line(i).end - ph(i).transLength * T;
    ph(i).B(2,:) = ph(i).B(1,:) + 1/5 * ph(i).u0^2 * T;
    ph(i).B(3,:) = ph(i).B(2,:);
    ph(i).B(4,:) = ph(i).B(3,:) + 1/15 * ph(i).u0 * ph(i).u2 * T + 1/15 * ph(i).u0 * ph(i).v2 * N;
    ph(i).B(5,:) = ph(i).B(4,:);
    ph(i).B(6,:) = ph(i).B(5,:) + 1/5 * (ph(i).u2^2 - ph(i).v2^2) * T + 2/5 * ph(i).u2 * ph(i).v2 * N;
end

end

