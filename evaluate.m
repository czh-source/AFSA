function [result] = evaluate(p,s,fo)
% ����p��s��fo�����������������ж�������0��ʾ��ʳ������1��ʾ��Ⱥ������2��ʾ׷β��p��������ʳ������Ŀ��״̬��s��������Ⱥ��Ϊ��Ŀ��״̬�����������fo������׷β��Ϊ��Ŀ��״̬���������
    global f Delta;
    result = 0;
    
    if s(3) ~= 0 && fo(4) == 0
        if f(s(1),s(2))/s(3) > Delta * f(p(2),p(2))
            result = 1;
        end
    elseif s(3) == 0 && fo(4) ~= 0
        if f(fo(1),fo(2))/fo(3) > Delta * f(p(2),p(2))
            result = 2;
        end
    elseif s(3) ~= 0 && fo(4) ~= 0
        if f(s(1),s(2)) > f(fo(1),fo(2))
            result = 1;
        else 
            result = 2;
        end
    end
end
