function B=genMatB(param,dim,tm)
%paramsΪ1��4��dimΪx_dim����N+1��tm��ָ��Ӧ��d������ʱ��
B=zeros(dim,dim);
delta=1/(dim-1);
if(dim<3)
    fprintf('dim need to be bigger than 2 to create mat B\n');
else
    ps=params;
    B(1,1)=param;
    B(dim,dim)=param;
    for i = 2:dim-1
        B(i,i-1)=-1*param*(ps.alfa()/delta^2+ps.P((i-2)*delta,tm)/delta);
        B(i,i)=param*(2*ps.alfa()/delta^2+ps.P((i-1)*delta,tm)/delta);
        B(i,i+1)=-1*param*ps.alfa()/delta^2;
    end
end