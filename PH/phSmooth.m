function h_ph = phSmooth(ph)
%PHSMOOTH 此处显示有关此函数的摘要
%   此处显示详细说明
t = linspace(0, 1, 100);
Qx = zeros(length(ph),100);
Qy = zeros(length(ph),100);
for i = 1:length(ph)
    for j = 1:length(t)
        
            Qx(i,j) = (1-t(j))^5 * ph(i).B(1,1) + ... 
                      5 * t(j) * (1-t(j))^4 * ph(i).B(2,1) + ...
                      10 * t(j)^2 * (1-t(j))^3 * ph(i).B(3,1) + ...
                      10 * t(j)^3 * (1-t(j))^2 * ph(i).B(4,1) + ...
                      5 * t(j)^4 * (1-t(j)) * ph(i).B(5,1) + ...
                      t(j)^5 * ph(i).B(6,1); 

            Qy(i,j) = (1-t(j))^5 * ph(i).B(1,2) + 5 * t(j) * (1-t(j))^4 * ph(i).B(2,2) + ...
                 10 * t(j)^2 * (1-t(j))^3 * ph(i).B(3,2) + ...
                 10 * t(j)^3 * (1-t(j))^2 * ph(i).B(4,2) + ...
                 5 * t(j)^4 * (1-t(j)) * ph(i).B(5,2) + ...
                 t(j)^5 * ph(i).B(6,2); 
  
    end
    h_ph = plot(Qx(i,:), Qy(i,:), 'yellow', 'LineWidth', 2,'DisplayName','PH');
end
end

    


