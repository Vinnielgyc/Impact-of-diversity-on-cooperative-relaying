function [eta_m den nom]=Mgroup(a1,N,trn,r_th2,r,T,tsymbol,m)

r_th1=2^(a1)-1;
p1=1-exp(-r_th1*(1+r*(1+trn))/trn/r/r); 
%one training time
tt=trn*tsymbol;
%denominator of spectral efficiency
den=zeros(1,N);
%nominator
nom=zeros(1,N);
eta_m=0;
r_m=0;
eta=zeros(1,N);
for l=1:1:N
    Pr=nchoosek(N,l)*(1-p1)^l*p1^(N-l);
    temp=r_th2(l)*(1+r*(1+trn))/r/trn/r;
    a2=log2(1+r_th2(l));
    if l<=m
        r_c=(ceil(l/2)+1)/(2*ceil(l/2));
        %1-pstii
        emp=0;  
        for j=0:l-1
            emp=emp+exp(-l*temp)*(l*temp)^j/factorial(j);
        end
        nom(l)=a1*(T-tt)*emp;
        den(l)=(T+T*a1/a2/r_c+(l+1)*tt);
    elseif l>m
        r_c=(ceil(m/2)+1)/(2*ceil(m/2));
        emp=0;
        for j=0:m-1
            emp=emp+exp(-m*temp)*(m*temp)^j/factorial(j);
        end
        nom(l)=a1*(T-tt)*emp;
        den(l)=(T+T*a1/a2/r_c+(m)*tt);
        
    end
    eta_m=eta_m+Pr*nom(l)/den(l);
    r_m=r_m+Pr*a2;
    eta(l)=nom(l)/den(l);
end
%den=den+T*nchoosek(N,0)*(1-p1)^0*p1^(N);

end

        
    