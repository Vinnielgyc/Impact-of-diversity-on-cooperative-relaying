function [eta_dis den nom]=DIS(a1,N,trn,r_th2,r,T,tsymbol)   % r and r_th order is different from others

r_th1=2^(a1)-1;
p1=1-exp(-r_th1*(1+r*(1+trn))/trn/r/r);
%one training time
tt=trn*tsymbol;
%denominator of spectral efficiency
den=zeros(1,N);
%nominator
nom=zeros(1,N);
eta_dis=0;
eta=zeros(1,N);
r_dis=0;
for l=1:1:N
    Pr=nchoosek(N,l)*(1-p1)^l*p1^(N-l);
    r_c=(ceil(l/2)+1)/(2*ceil(l/2));
    temp=r_th2(l)*(1+r*(1+trn))/r/trn/r;
    %1-pstii
    emp=0;  
    for j=0:l-1
        emp=emp+exp(-l*temp)*(l*temp)^j/factorial(j);
    end
    a2=log2(1+r_th2(l));
    nom(l)=a1*(T-tt)*emp;
    den(l)=(T+T*a1/a2/r_c+(l+1)*tt);
    eta_dis=eta_dis+nom(l)/den(l)*Pr; 
    r_dis=r_dis+Pr*a2;
    eta(l)=nom(l)/den(l);
end
%den=den+T*nchoosek(N,0)*(1-p1)^0*p1^(N);


end

