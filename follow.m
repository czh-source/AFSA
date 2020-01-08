function [next] = follow(i,j)
% ���ص�i����j����׷βĿ��״̬���������nf���Ƿ����ʺ�׷βĿ�꣨0��ʾû�У�1��ʾ�У�
    global AF AfNumber Visual f Delta;
    % �Ȱ�ʳ�����ߵĻ����Ϊ����nf��Ϊ-1����Ϊ�����nf�����������ͳ�ƽ�ȥ������Ϊ0
    bestx = AF(j,1,i);
    besty = AF(j,2,i);
    nf = -1;
    ifHaveTarget = 0;
    
    for a = 1:AfNumber
        if sqrt((AF(j,1,i) - AF(a,1,i))^2 + (AF(j,2,i) - AF(a,2,i))^2) <= Visual
            nf = nf + 1;
        end
    end
    
    for a = 1:AfNumber
        if sqrt((AF(j,1,i) - AF(a,1,i))^2 + (AF(j,2,i) - AF(a,2,i))^2) <= Visual && (f(AF(a,1,i),AF(a,2,i)))/nf > Delta * f(bestx,besty)
            bestx = AF(a,1,i);
            besty = AF(a,2,i);
            ifHaveTarget = 1;
        end
    end
    
    next = [bestx,besty,nf,ifHaveTarget];
end
