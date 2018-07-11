clc        %%���еõ�����������
clear;    
           
load('ecg1');
x=ecg1;

N=1024;   
                                      % M=922;     %  ������(M>=K*log(N/K),
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

for l=1:15        %  ѹ����  15�ֱ���

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

for k=1:5;               % �ع��㷨   5�ֱ���
    for j=1:52;       % С����  52�ֱ���
PRDsum=0;     
i=0;
tic
while i<10;      %i<10;               %���Դ���  10
Phi=BernoulliMtx( M,N );                                          
y=Phi*x;                                                     
[ww]=dwtmtxx( N, 'j',5);
Psi=[ww];                                  
T=Phi*Psi'; 

switch k                                         %�ع��㷨ѡ��  K����
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



end                   % ����10�� ����
A(j,2*k-1)=PRDsum/i ;
A(j,2*k)=toc/i ;
sprintf('Sheet'+l+'  �ع��㷨'+k+'  ϡ���'+j+'  ���')
    end         %С����������
    sprintf('Sheet'+l+'  �ع��㷨'+k+'  ���')
end           % �ع��㷨�������� 
sprintf('Sheet'+l+'  ���')

tabel=CR{l};

xlswrite('test.xlsx',A,tabel,'C4');
sprintf('Sheet'+l+'  �Ѵ���� ')
end           % 15��ѹ���� ��������


sprintf('All  Complete')







