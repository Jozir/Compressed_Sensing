%���� ��ͬѹ�����µ��㷨�ع���ʱ ͼ     

load('plot1.mat');    %�ع�ʱ���
 x=10:5:80;
b1=plot1(:,1); %ÿ�����ݻ�һ������
b2=plot1(:,2);
b3=plot1(:,3);
b4=plot1(:,4);
b5=plot1(:,5);


hold on;
plot(x,b1,'g-');                % plot(x,b1,'k-s');
plot(x,b2,'b-');                % plot(x,b2,'k-p');
plot(x,b3,'r-');                % plot(x,b3,'k-+');
plot(x,b4,'k-');                % plot(x,b4,'k-o');
plot(x,b5,'y-');                % plot(x,b5,'k-*');
legend('omp','bp','cosamp','irls','sp')  
xlabel('ѹ����(%)')
ylabel('ʱ��(s)')