%��ͬѹ�����µ��ع����

load('plot2.mat'); %�ع�����PRD��
 x=10:5:80;
c1=plot2(:,1);   %ÿ�����ݻ�һ������
c2=plot2(:,2);
c3=plot2(:,3);
c4=plot2(:,4);
c5=plot2(:,5);


hold on;

plot(x,c1,'g-');                
plot(x,c2,'b-');             
plot(x,c3,'r-');            
plot(x,c4,'k-');              
plot(x,c5,'y-');                



legend('omp','bp','cosamp','irls','sp')
xlabel('ѹ����(%)')
ylabel('PRD(%)')

