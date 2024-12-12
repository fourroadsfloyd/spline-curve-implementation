function ph = phParameter(ph,line,MaxSmoothError)
%PHPRA 此处显示有关此函数的摘要
% 计算PH曲线的参数

for i = 1:length(line)-1
    ph(i).miu = 2*(17+18*cos(pi-line(i).angle));
    if ph(i).miu == 0 
        ph(i).k = MaxSmoothError * (32 / 17) / (cos(line(i).angle/2));
        
        ph(i).d = ph(i).k / 2;
        
        ph(i).u0 = sqrt(5*ph(i).d);
        
        ph(i).u2 = sqrt(45* ph(i).k * (1+cos(pi-line(i).angle))) / 6;
        
        ph(i).v2 = sqrt(ph(i).u0^2 - ph(i).u2^2);
        
    else
        ph(i).k = MaxSmoothError / (cos(line(i).angle/2) * ...
                          (1 - (15/16) * (18 * (1+cos(pi - line(i).angle)) - 3 * sqrt(2*(1+cos(pi-line(i).angle)))) /...
                          (18 * (1+cos(pi-line(i).angle)) -1)));
                      
        ph(i).lamda = 36 * ph(i).k * (1+cos(pi - line(i).angle));
        
        ph(i).D = ph(i).k * sqrt(72 * (1 + cos(pi - line(i).angle)));
        
        ph(i).d = (ph(i).lamda - ph(i).D) / ph(i).miu;
        
        ph(i).u0 = sqrt(5*ph(i).d);
        
        ph(i).u2 = sqrt((5*(ph(i).lamda - ph(i).D) * sin(pi-line(i).angle)^2) / (2 * ph(i).miu * (1 - cos(pi - line(i).angle))));
        
        ph(i).v2 = sqrt(ph(i).u0^2 - ph(i).u2^2);                     
    end
    
    ph(i).B = zeros(6,2);
    
end

end

