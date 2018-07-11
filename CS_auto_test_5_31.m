clc        %%运行得到完整的数据
clear;    
           
load('ecg1');
x=ecg1;

N=1024;   
                                      % M=922;     %  测量数(M>=K*log(N/K),
CR(1)={'Sheet10'};
CR(2)={'Sheet15'};
CR(3)={'Sheet20'};
CR(4)={'Sheet25'};
CR(5)={'Sheet30'};
CR(6)={'Sheet35'};
CR(7)={'Sheet40'};
CR(8)={'Sheet45'};
CR(9)={'Sheet50'};
CR(10)={'Sheet55'};
CR(11)={'Sheet60'};
CR(12)={'Sheet65'};
CR(13)={'Sheet70'};
CR(14)={'Sheet75'};
CR(15)={'Sheet80'};

A=zeros(52,10);      

for l=1:15        %  压缩率  15种遍历

switch l
    case 1
        M=922;  % 10%
   case 2
        M=870;  %  15%
    case 3
        M=819;  %  20%
    case 4
        M=768;   % 25%
    case 5 
        M=719;  % 30 %
    case 6
        M=666;  %  35%
    case 7
        M=614;  %   40%
    case 8
        M=563;   %  45 %
    case 9
        M=512;   %  50%
    case 10
        M=461;  %  55%
    case 11
        M=410;  %   60%
    case 12
        M=358;  %   65%
    case 13
        M=307;   %  70%
    case 14
        M=256;  %  75%
    case 15
        M=205;  %  80%
end 

for k=1:5;               % 重构算法   5种遍历
    for j=1:52;       % 小波基  52种遍历
PRDsum=0;     
i=0;
tic
while i<10;      %i<10;               %测试次数  10
Phi=BernoulliMtx( M,N );                                          
y=Phi*x;                                                     
[ww]=dwtmtxx( N, 'j',5);
Psi=[ww];                                  
T=Phi*Psi'; 

switch k                                         %重构算法选择  K决定
    case 1
         hat_s=cs_omp(y,T,N);
         hat_x=real(Psi'*hat_s.');                  
    case 2
        hat_s=cs_bp(y,T,N);    
        hat_x=real(Psi'*hat_s);        
    case 3
         hat_s=cs_cosamp(y,T,N);
         hat_x=real(Psi'*hat_s.');         
    case 4
         hat_s=cs_irls(y,T,N);  
         hat_x=real(Psi'*hat_s);       
    case 5
         hat_s=cs_sp(y,T,N); 
         hat_x=real(Psi'*hat_s.');       
end


PRD=norm(x-hat_x)/norm(x)*100;     
PRDsum=PRDsum+PRD;                  
i=i+1;                                           



end                   % 运行10次 结束
A(j,2*k-1)=PRDsum/i ;
A(j,2*k)=toc/i ;
sprintf('Sheet'+l+'  重构算法'+k+'  稀疏基'+j+'  完成')
    end         %小波遍历结束
    sprintf('Sheet'+l+'  重构算法'+k+'  完成')
end           % 重构算法遍历结束 
sprintf('Sheet'+l+'  完成')

tabel=CR{l};

xlswrite('test.xlsx',A,tabel,'C4');
sprintf('Sheet'+l+'  已存入表 ')
end           % 15种压缩率 遍历结束


sprintf('All  Complete')







