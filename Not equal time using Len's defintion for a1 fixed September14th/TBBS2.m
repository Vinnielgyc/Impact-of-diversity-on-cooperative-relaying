function [r_th lambda]=TBBS2(a1,N,trn,r,T,tsymbol)

r_th=zeros(1,length(N));
lambda=zeros(1,length(N));
%lam=[100,400,700,1000,1200,1400,1600,1800,1900,2100];
lam=100:100:5000;
tg=50;      
count=100;


for n=1:N
    n
    eta_temp=zeros(length(lam),count);
    
    for j=1:length(lam);
    [pcoll ts]=T_poll(n,trn,r,lam(j),tg);
    
    for i=1:count
        r_th2=i/count*r;
        a2=log2(1+r_th2);
        p2=1-exp(-i/count*(1+r*(1+trn))/trn/r);
        eta_temp(j,i)=(1-p2^n)*(1-pcoll)/(T+ts+2*trn*tsymbol+T*a1/a2);
    end
    end
    [inde1, inde2]=find(eta_temp==max(max(eta_temp)));
    lambda(1,n)=lam(inde1(1));
    r_th(1,n)=inde2(1)/count*r;
end

