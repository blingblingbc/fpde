function u=main(x_Dim,t_Dim)
u=zeros(t_Dim+1,x_Dim);
[u(1,:),u(2,:),u(3,:)]=init(@g,@dg,@ddg,x_Dim,0,1);

