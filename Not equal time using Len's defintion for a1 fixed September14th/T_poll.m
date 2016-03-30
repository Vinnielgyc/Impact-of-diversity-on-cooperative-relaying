function [pcoll ts]=T_poll(L,trn,r,lam,tg)
if L==1
    pcoll=0;
    ts=0;
else
beta=(1+r*trn)/(r*trn); %%

f=@(x) lam./(x.^2).*exp(-beta.*lam./x).*exp(-beta.*lam./(x-tg)).*(1-exp(-beta.*lam./x)).^(L-2);
g=@(x) exp(-beta.*lam./x)./x.*(1-exp(-beta.*lam./x)).^(L-1);
%warning('off','all');
pcoll=1-L*(L-1)*beta*quadgk(f,tg,Inf);
%warning('off','all');
ts=L*beta*lam*quadgk(g,0,Inf);
end