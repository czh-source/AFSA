function [next] = swarm(i,j)
% ��ȡ��i����j���ľ�ȺĿ��״̬����Ұ�ڻ����nf����nfΪ0��˵����Ұ��û�л��
    global AF AfNumber Visual;
    nf = 0;     % ��Ұ�ڵ�Ŀ����������ʼֵΪ0
    % �����ѭ��Ѱ����Ұ�ڻ��ʱҪ�ų����������������
    if j == 1
        for a = 2:AfNumber
            if sqrt((AF(j,1,i) - AF(a,1,i))^2 + (AF(j,2,i) - AF(a,2,i))^2) <= Visual
                nf = nf +1;
                friend(nf,1) = AF(a,1,i);
                friend(nf,2) = AF(a,2,i);
            end
        end
    elseif j == AfNumber
        for a = 1:AfNumber-1
            if sqrt((AF(j,1,i) - AF(a,1,i))^2 + (AF(j,2,i) - AF(a,2,i))^2) <= Visual
                nf = nf +1;
                friend(nf,1) = AF(a,1,i);
                friend(nf,2) = AF(a,2,i);
            end
        end
    else
        for a = 1:j-1
            if sqrt((AF(j,1,i) - AF(a,1,i))^2 + (AF(j,2,i) - AF(a,2,i))^2) <= Visual
                nf = nf +1;
                friend(nf,1) = AF(a,1,i);
                friend(nf,2) = AF(a,2,i);
            end
        end
        for a = j+1:AfNumber
            if sqrt((AF(j,1,i) - AF(a,1,i))^2 + (AF(j,2,i) - AF(a,2,i))^2) <= Visual
                nf = nf +1;
                friend(nf,1) = AF(a,1,i);
                friend(nf,2) = AF(a,2,i);
            end
        end
    end
    
    % ��������������
    friend_position(1) = 0;
    friend_position(2) = 0;
    xc = 0;
    yc = 0;
    if nf ~= 0
        for a = 1:nf
            friend_position(1) = friend_position(1) + friend(a,1);
            friend_position(2) = friend_position(2) + friend(a,2);
        end
        xc = friend_position(1)/nf;
        yc = friend_position(2)/nf;
    end
    next = [xc,yc,nf];
end

