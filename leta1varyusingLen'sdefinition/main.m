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
a1=1.8:0.02:3.5; %the SNR threshold is also 1

ETA=zeros(5,length(N));
r_av=zeros(5,length(a1)); %this is in fact not used. (average rate in second phase)
a=zeros(5,length(N));

for n=1:length(N)

eta=zeros(5,length(a1));

for i=1:length(a1);
    
    [r_th2_bs, lam]=TBBS2(a1(i),n,trn,r,T,tsymbol);
    r_th2_dis=DIS2(a1(i),n,trn,r,T,tsymbol);
    r_th2_2=Mgroup2(a1(i),n,trn,r,T,tsymbol,2);
    r_th2_3=Mgroup2(a1(i),n,trn,r,T,tsymbol,3);
    r_th2_4=Mgroup2(a1(i),n,trn,r,T,tsymbol,4);


    eta(1,i)=TBBS(a1(i),n,trn,r_th2_bs,r,T,tsymbol,lam);
    eta(2,i)=DIS(a1(i),n,trn,r_th2_dis,r,T,tsymbol);
    eta(3,i)=Mgroup(a1(i),n,trn,r_th2_2,r,T,tsymbol,2);
    eta(4,i)=Mgroup(a1(i),n,trn,r_th2_3,r,T,tsymbol,3);
    eta(5,i)=Mgroup(a1(i),n,trn,r_th2_4,r,T,tsymbol,4);
end
    [temp1 temp2]= max(eta');
    ETA(:,n)= temp1';
    a(:,n)=a1(temp2);
end

figure(1)
plot(N,ETA(1,:),'k-',N,ETA(2,:),'b-',N,ETA(3,:),'r+-',N,ETA(4,:),'ro-',N,ETA(5,:),'rd-');
set(gca,'FontSize',12);
legend(' TBBS',' STC',' M=2',' M=3',' M=4');
grid;
ylim([0 1.2]);
xlim([1 10]);
xlabel('Number of Potential Relays, N','fontsize',12);
ylabel('Spectral Efficiency, \eta','fontsize',12);
set( findobj(gca,'type','line'), 'LineWidth', 2);

figure(2)
plot(N,a(1,:),'k-',N,a(2,:),'b-',N,a(3,:),'r+-',N,a(4,:),'ro-',N,a(5,:),'rd-');
set(gca,'FontSize',12);
legend(' TBBS',' STC',' M=2',' M=3',' M=4');
grid;
ylim([0 4]);
xlim([1 10]);
xlabel('Number of Potential Relays, N','fontsize',12);
ylabel('Rate-Bandwidth Ratio in Phase One, r_{1}/B','fontsize',12);
set( findobj(gca,'type','line'), 'LineWidth', 2);

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