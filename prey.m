function [next] = prey(i,j)
% ���ص�i����j������ʳĿ��״̬
    global TryNumber f AF;
    % �ѵ�ǰ״̬��������Ϊ���
    bestx = AF(j,1,i);
    besty = AF(j,2,i);
    
    % ��ʳѭ�����Ҳ������õ�״̬������ң���ೢ��TryNumber��
    t = 1;
    while t <= TryNumber
        t = t + 1;
        preyNext = randPositionInVisual(AF(j,1,i),AF(j,2,i));
        if f(preyNext(1),preyNext(2)) > f(AF(j,1,i),AF(j,2,i))
            bestx = preyNext(1);
            besty = preyNext(2);
            break;
        end
    end
    
    % ��������ﻹû�ҵ����õ�״̬���򷵻�һ�����״̬�����򷵻��ҵ���״̬
    if bestx == AF(j,1,i) && besty == AF(j,2,i)
        next = randPositionInVisual(AF(j,1,i),AF(j,2,i)); 
    else
        next = [bestx besty];
    end
end

