function [dne,d0,d1]=init(funname,dfunname,ddfunname,x_Dim,x_start,x_end)
%º∆À„d-1°¢d0°¢d1œÚ¡ø
x=linspace(x_start,x_end,x_Dim);
delta_x=(x_end-x_start)/(x_Dim-1);
f=zeros(size(x));
df=zeros(size(x));
ddf=zeros(size(x));
for i=1:x_Dim
    f(i)=funname(x(i));
    df(i)=dfunname(x(i));
    ddf(i)=ddfunname(x(i));
end
tmp_d0=(f*6/(delta_x*delta_x)-ddf);
tmp_d1=(ddf+tmp_d0/3+2*df/delta_x);
dne=(ddf+tmp_d0/3-tmp_d1/2)*(delta_x*delta_x)/6;
d0=tmp_d0*(delta_x*delta_x)/36;
d1=tmp_d1*(delta_x*delta_x)/12;

    
