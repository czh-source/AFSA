function [next] = moveto(x,y,nowx,nowy)
% ����(x,y,nowx,nowy)��ʾ��Ŀ��x���꣬Ŀ��y���꣬���ѵ�x���꣬�Լ���y���꣩������һ����������ʾҪ������������ƶ�����zero��ʶΪ1����ʾĿ��λ�ú͵�ǰ�غϣ���Ҫ�ƶ�
    global Step
    long = Step * rand();       % ���ѡһ���ƶ�����
%     % Խ�紦��
%     if x > 10
%         x = 10;
%     elseif x < -10
%         x = -10;
%     end
%     if y > 10
%         y = 10;
%     elseif y < -10
%         y = -10;
%     end
%     if nowx > 10
%         nowx = 10;
%     elseif nowx < -10
%         nowx = -10;
%     end
%     if nowy > 10
%         nowy = 10;
%     elseif nowy < -10
%         nowy = -10;
%     end
    zero = 0;
    n = ones(1,2);
    if x ~= nowx && y ~= nowy
        n = [x y] - [nowx nowy]; 
        n = n/norm(n);              % ������������ģ�õ���λ����
        n = long * n;
        % Խ�紦��
        if nowx + n(1) > 10
            n(1) = 10 - nowx;
        elseif nowx + n(1) < -10
            n(1) = -10 - nowx;
        end
        if nowy + n(2) > 10
            n(2) = 10 - nowy;
        elseif nowy + n(2) < -10
            n(2) = -10 - nowy;
        end
    else
        zero = 1;
    end
    next = [n(1),n(2),zero];
end