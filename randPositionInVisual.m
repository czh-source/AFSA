function [ax] = randPositionInVisual(x0,y0)
% ��ȡ��Ұ�ڵ�һ���������
    global Visual;
    r = Visual * rand();        % �����ȡһ����������Ұ�İ뾶
    seta = 2 * pi * rand();     % �����ȡһ���Ƕ�
    x = x0 + r * cos(seta);     % ���x����
    y = y0 + r * sin(seta);     % ���y����
    
    % Խ�紦��
    if x > 10
        x = 10;
    elseif x < -10
        x = -10;
    end
    
    if y > 10
        y = 10;
    elseif y < -10
        y = -10;
    end
    
    ax = [x,y];
end

