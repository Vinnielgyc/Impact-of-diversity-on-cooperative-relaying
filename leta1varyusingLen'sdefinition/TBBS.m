function [eta_bs den nom]=TBBS(a1,N,trn,r_th2,r,T,tsymbol,lam)  
%r_th2 is a vector;
%lam=[100,400,700,1000,1200,1400,1600,1800,1900,2100];   
tg=50;
r_th1=2^(a1)-1;
p1=1-exp(-r_th1*(1+r*(1+trn))/trn/r/r); %%
%one training time
tt=trn*tsymbol;

%denominator of spectral efficiency
den=zeros(1,N);
%nominator
nom=zeros(1,N);
eta_bs=0;
eta=zeros(1,N);
r_bs=0;
for l=1:1:N
    [pcoll ts]=T_poll(l,trn,r,lam(l),tg);
    Pr=nchoosek(N,l)*(1-p1)^l*p1^(N-l);
    p2=1-exp(-r_th2(l)*(1+r*(1+trn))/trn/r/r);
    a2=log2(1+r_th2(l));
 %  nom=nom+a1*(T-tt)*Pr*(1-pcoll)*(1-p2^l);
 %  den=den+(T+ts+2*tt+T*a1/a2)*Pr;
    nom(l)=a1*(T-tt)*(1-pcoll)*(1-p2^l);
    den(l)=(T+ts+2*tt+T*a1/a2);
    r_bs=r_bs+Pr*a2;
    eta_bs=eta_bs+nom(l)/den(l)*Pr;
    eta(l)=nom(l)/den(l);
end


%     den=den+T*nchoosek(N,0)*(1-p1)^0*p1^(N);
%     eta_bs=nom/den; 