function line = transitionLength(line,MaxSmoothError)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%ÿ���нǶ�Ӧһ�����ɳ��ȣ������ǶԳƵ�

for i = 1 : length(line)-1
    
    a = 5 * 3 * MaxSmoothError / cosd(line(i).pangle/2); %�����е�ʽ26
    b = line(i).length / 2;
    c = line(i+1).length / 2;
    
    if i==1
        b = line(i).length;
    end
    
    if i==length(line)
        c = line(i).length;
    end
    
    if a < b
       min = a;
    else
       min = b;
    end
    if c < min
        min = c;
    end
    
    line(i).transLength = min;
   
end

line(length(line)).transLength=0; %��������������

end

