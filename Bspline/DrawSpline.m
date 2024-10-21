% DrawSpline.m�ļ�

function DrawSpline(n, k, P, NodeVector)
% B�����Ļ�ͼ����
% ��֪n+1�����ƶ���P(i), k��B������P��2*(n+1)�������ƶ�������, �ڵ�����NodeVector

Nik = zeros(n+1, 1);
for u = 0 : 0.005 : 1
    for i = 1 : 1 : n
        Nik(i+1, 1) = baseFunction(i, k , u, NodeVector);
    end
    p_u = P .* Nik;
    if u == 0
        tempx = p_u(1,1);
        tempy = p_u(2,1);
        line([tempx p_u(1,1)], [tempy p_u(2,1)],...
            'Marker','.','LineStyle','-', 'Color',[.3 .6 .9], 'LineWidth',3);
    else
        line([tempx p_u(1,1)], [tempy p_u(2,1)],...
            'Marker','.','LineStyle','-', 'Color',[.3 .6 .9], 'LineWidth',3);
        tempx = p_u(1,1);
        tempy = p_u(2,1);
    end
end
