function line = lineVector(line)
%LINEVECTOR �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

for i=1:length(line)
    line(i).vector(1,:) = (line(i).end - line(i).start) / line(i).length;    %startָ��end
end

end

