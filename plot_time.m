%生成 不同压缩率下的算法重构耗时 图     

load('plot1.mat');    %重构时间表
 x=10:5:80;
b1=plot1(:,1); %每列数据画一条折线
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
xlabel('压缩率(%)')
ylabel('时间(s)')