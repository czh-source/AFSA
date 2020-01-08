disp('����ִ���˹���Ⱥ�㷨');

global AfNumber Visual Step Delta TryNumber AF f;

AfNumber = 100;
Visual = 8;
Step = 4;
Delta = 0.1;
TryNumber = 5;
MaxIteration = 50;

% ���Ժ���
% f = @(x,y) sin(sqrt(x.^2 + y.^2))./(sqrt(x.^2 + y.^2));
f = @(x,y) (1.5 - x + x.*y).^2 + (2.25 - x + x.*y.^2).^2 + (2.625 - x + x.*y.^3).^2;
% f = @(x,y) y.*sin(x) - x.*cos(y);

% ��ʼ����һ���˹���Ⱥ��״̬(����ֲ�λ��)
AF = ones(AfNumber,2,MaxIteration+1);           % ��ά�����¼AF�����ݣ���һά����ڼ������ڶ�ά�������꣬����ά����ڼ���
for i = 1:AfNumber
    AF(i,1,1) = -10 + 20*rand();
    AF(i,2,1) = -10 + 20*rand();
end

% ����ÿ����һ���˹����ʳ���
% AF_Food = ones(AfNumber,MaxIteration);      % ÿһ�ж�Ӧһ��AF�����б�ʾ������ʳ���
% % for i = 1:AfNumber
% %     AF_Food(i,1) = f(AF(i,1,1),AF(i,2,1));
% % end

% ����ʵ����Ժ���ͼ��
[a,b] = meshgrid(-10:0.1:10);
c = f(a,b);
figure('Name','ʵ����Ժ���');
mesh(a,b,c), xlabel('x����'), ylabel('y����'), zlabel('ʳ���');
colorbar;

figure('Name','ʵ����Ժ���');
mesh(a,b,c), xlabel('x����'), ylabel('y����'), zlabel('ʳ���');
view(2);
colorbar;

%���Ƴ�ʼ�˹���ֲ�ͼ��
% figure('Name','�˹���ֲ�');
% mesh(a,b,c);
% colormap(gray);
% view(2);
% hold on;
% x = AF(:,1,1);
% y = AF(:,2,1);
% scatter(x,y,'filled');

% i����ڼ�����j����ڼ���
for i = 1:MaxIteration
    for j = 1:AfNumber
        next_p = prey(i,j);       % ��ʳ��Ϊ�ҵ�����һ��״̬
        next_s = swarm(i,j);      % ��Ⱥ��Ϊ�ҵ�����һ��״̬
        next_f = follow(i,j);     % ׷β��Ϊ�ҵ�����һ��״̬
        er = evaluate(next_p,next_s,next_f);
        if er == 1
            % ��Ⱥ��������һ������
            next = moveto(next_s(1),next_s(2),AF(j,1,i),AF(j,2,i));
            if next(3) == 1
                AF(j,1,i+1) = AF(j,1,i);
                AF(j,2,i+1) = AF(j,2,i);
            else
                AF(j,1,i+1) = AF(j,1,i) + next(1);
                AF(j,2,i+1) = AF(j,2,i) + next(2);
            end
        elseif er == 2
            % ׷β��������һ������
            next = moveto(next_f(1),next_f(2),AF(j,1,i),AF(j,2,i));
            if next(3) == 1
                AF(j,1,i+1) = AF(j,1,i);
                AF(j,2,i+1) = AF(j,2,i);
            else
                AF(j,1,i+1) = AF(j,1,i) + next(1);
                AF(j,2,i+1) = AF(j,2,i) + next(2);
            end
        else
            % ��ʳ��������һ������
            next = moveto(next_p(1),next_p(2),AF(j,1,i),AF(j,2,i));
            if next(3) == 1
                AF(j,1,i+1) = AF(j,1,i);
                AF(j,2,i+1) = AF(j,2,i);
            else
                AF(j,1,i+1) = AF(j,1,i) + next(1);
                AF(j,2,i+1) = AF(j,2,i) + next(2);
            end
        end
    end
            
    % ��ͼ
    if mod(i-1,5) == 0
        figure('Name','�˹���ֲ�');
%         mesh(a,b,c);
%         shading interp;
%         colormap(gray);
%         view(2);
%         hold on;
        x = AF(:,1,i);
        y = AF(:,2,i);
        scatter(x,y,'filled');
    end
end

% % ����ÿ��ÿ�������ʳ���
% AF_Food = ones(MaxIteration,AfNumber);      % ÿ�д���һ����ÿ�д���һ��
% for i = 1:MaxIteration
%     for j = 1:AfNumber
%         AF_Food(i,j) = f(AF(j,1,i),AF(j,2,i));
%     end
% end
% 
% % ���������ƽ��ʳ��ȣ�����ͼ
% Average_Food = zeros(1,MaxIteration);
% for i = 1:MaxIteration
%     for j = 1:AfNumber
%         Average_Food(i) = Average_Food(i) + AF_Food(i,j);
%     end
%     Average_Food(i) = Average_Food(i)/AfNumber;
% end
% 
% xias = randperm(MaxIteration);              % ����һ����MaxIteration��Ԫ�ص�һά���飬1~MaxIteration��ÿ����������һ��
% sort(xias);                                 % ����
% figure('Name','����ƽ��ʳ���');
% scatter(xias,Average_Food);
