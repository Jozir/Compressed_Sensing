%不同压缩率下的重构误差

load('plot2.mat'); %重构误差表（PRD）
 x=10:5:80;
c1=plot2(:,1);   %每列数据画一条折线
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
xlabel('压缩率(%)')
ylabel('PRD(%)')

