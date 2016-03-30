function [r_th]=DIS2(a1,N,trn,r,T,tsymbol)
r_th=zeros(1,length(N));
count=100;

for n=1:N
    eta_temp=zeros(1,count);
    r_c=(ceil(n/2)+1)/(2*ceil(n/2));
    for i=1:count
        r_th2=i/count*r;
        a2=log2(1+r_th2);
        temp=r_th2*(1+r*(1+trn))/r/trn/r;
        %1-pstii
        emp=0;  
        for j=0:n-1
            emp=emp+exp(-n*temp)*(n*temp)^j/factorial(j);
        end
 
        eta_temp(i)=emp/(T+T*a1/a2/r_c+(n+1)*trn*tsymbol);
    end
    [valu, index]=max(eta_temp);
    r_th(n)=index/count*r;
end
        