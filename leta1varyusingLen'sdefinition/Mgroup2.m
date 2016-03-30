function [r_th]=Mgroup2(a1,N,trn,r,T,tsymbol,m)
r_th=zeros(1,length(N));
count=100;
r_temp=DIS2(a1,N,trn,r,T,tsymbol);

for n=1:N
    if n<=m
        r_th(n)=r_temp(n);
    elseif n>m
    eta_temp=zeros(1,count);
    r_c=(ceil(m/2)+1)/(2*ceil(m/2));
    for i=1:count
        r_th2=i/count*r;
        a2=log2(1+r_th2);
        temp=r_th2*(1+r*(1+trn))/r/trn/r;
        %1-pmii
        emp=0; 
        for j=0:m-1
            emp=emp+exp(-m*temp)*(m*temp)^j/factorial(j);
        end
        eta_temp(i)=emp/(T+T*a1/a2/r_c+m*trn*tsymbol);
    end
    [valu, index]=max(eta_temp);
    r_th(n)=index/count*r;
    end
end