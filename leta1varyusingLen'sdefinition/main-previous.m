clc; clear;

%Time in the first phase.
T=5*10^3; 
tsymbol=100;

%Number of relays 
N=1:10;


% number of training symbols
trn=3;

%average SNR
r=10;

%rate bandwidth ratio for the first phase

a1=2;

eta=zeros(5,length(N));

a=zeros(5,length(N));


[r_th2_bs, lam]=TBBS2(a1,length(N),trn,r,T,tsymbol);
r_th2_dis=DIS2(a1,length(N),trn,r,T,tsymbol);
r_th2_2=Mgroup2(a1,length(N),trn,r,T,tsymbol,2);
r_th2_3=Mgroup2(a1,length(N),trn,r,T,tsymbol,3);
r_th2_4=Mgroup2(a1,length(N),trn,r,T,tsymbol,4);
    
for n=1:length(N);
 
    [eta(1,n)]=TBBS(a1,n,trn,r_th2_bs,r,T,tsymbol,lam);
    [eta(2,n)]=DIS(a1,n,trn,r_th2_dis,r,T,tsymbol);
    [eta(3,n)]=Mgroup(a1,n,trn,r_th2_2,r,T,tsymbol,2);
    [eta(4,n)]=Mgroup(a1,n,trn,r_th2_3,r,T,tsymbol,3);
    [eta(5,n)]=Mgroup(a1,n,trn,r_th2_4,r,T,tsymbol,4);
end
%    [temp1 temp2]= max(eta');
%    ETA(:,n)= temp1';
 %   a(:,n)=a1(temp2);


% plot(N,eta1(temp2(1),:),'k-',N,eta2(temp2(2),:),'b-',N,eta3(temp2(3),:),'r+--',N,eta4(temp2(4),:),'ro--',N,eta5(temp2(5),:),'rd--');
% set(gca,'FontSize',12);
% legend(' TBBS',' STC',' M=2',' M=3',' M=4');
% grid;
% xlim([1 10]);
% ylim([0 1.2]);
% xlabel('Number of potential relays','fontsize',12);
% ylabel('Spectral Efficiency, \eta Distribution' ,'fontsize',12);
    
    

figure(1)
plot(N,eta(1,:),'k-',N,eta(2,:),'b-',N,eta(3,:),'r+--',N,eta(4,:),'ro--',N,eta(5,:),'rd--');
set(gca,'FontSize',12);
legend(' TBBS',' STC',' M=2',' M=3',' M=4');
grid;
xlim([1 10]);
ylim([0 1.2]);
xlabel('Number of potential relays, N','fontsize',12);
ylabel('Spectral Efficiency, \eta','fontsize',12);

% figure(4)
% plot(N,den1(temp2(1),:),'k-',N,den2(temp2(2),:),'b-',N,den3(temp2(3),:),'r+--',N,den4(temp2(4),:),'ro--',N,den5(temp2(5),:),'rd--');
% set(gca,'FontSize',12);
% legend(' TBBS',' STC',' M=2',' M=3',' M=4');
% grid;
% xlabel('Number of potential relays','fontsize',12);
% ylabel('Denominator: Time','fontsize',12);
% xlim([1 10]);
% ylim([0 5*10^4]);
% 
% figure(5)
% plot(N,nom1(temp2(1),:),'k-',N,nom2(temp2(2),:),'b-',N,nom3(temp2(3),:),'r+--',N,nom4(temp2(4),:),'ro--',N,nom5(temp2(5),:),'rd--');
% set(gca,'FontSize',12);
% legend(' TBBS',' STC',' M=2',' M=3',' M=4');
% grid;
% xlabel('Number of potential relays','fontsize',12);
% ylabel('Numerator: Bits/Hertz','fontsize',12);
% xlim([1 10]);
% ylim([0 2*10^4]);
% figure(2)
% plot(N,a(1,:),'k-',N,a(2,:),'b-',N,a(3,:),'r+--',N,a(4,:),'ro--',N,a(5,:),'rd--');
% set(gca,'FontSize',12);
% legend('TBBS','STC','M=2','M=3','M=4');
% grid;
% xlim([1 10]);
% ylim([0 4]);
% xlabel('Number of potential relays','fontsize',12);
% ylabel('Rate-Bandwidth Ratio in Phase One a1','fontsize',12);

% figure(2)
% plot(1:N,r_av(1,:),'k-',1:N,r_av(2,:),'b-.',1:N,r_av(3,:),'r+--',1:N,r_av(4,:),'ro--',1:N,r_av(5,:),'rd--');
% ylim([0 3.5]);
% legend('TBBS','ST','2group','3group','4group');
% xlabel('Number of potential relay');
% ylabel('Rate in second phase')
% grid;

% figure(3)
% plot(N, lam);
% xlabel('Number of potential relay');
% ylabel('\lambda')

save('mydata');