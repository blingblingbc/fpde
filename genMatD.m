function d=genMatD(x_Dim,t_Dim,gamma)
%x_Dim表示N+1，t_Dim表示M，pamma表示分数阶参数
d=zeros(t_Dim+2,x_Dim);
delta_x=1/(x_Dim-1);
delta_t=1/(t_Dim-1);
[d(1,:),d(2,:),d(3,:)]=init(@g,@dg,@ddg,x_Dim,0,1);
ps=params;
for m = 3:t_Dim+1
    F=zeros(x_Dim,1);
    F(1)=left_boun((m-2)*delta_t);
    F(x_Dim)=right_boun((m-2)*delta_t);
    for i =2:x_Dim-1
        F(i)=ps.f((i-1)*delta_x,(m-2)*delta_t);
    end
    if(m==3)
        F = F - genMatA(-1,x_Dim,delta_t,gamma)*d(1,:)'-genMatA(1,x_Dim,delta_t,gamma)*d(3,:)';  
    else
        F = F - genMatA(-1*(m-2)^(1-gamma)+(m-3)^(1-gamma),x_Dim,delta_t,gamma)*d(1,:)'-genMatA((m-4)^(1-gamma)-(m-3)^(1-gamma),x_Dim,delta_t,gamma)*d(2,:)'-genMatA(2^(1-gamma)-1,x_Dim,delta_t,gamma)*d(m-1,:)'-genMatA(1,x_Dim,delta_t,gamma)*d(m,:)';
    end
    for k=1:m-4
       F = F - genMatA((m-k-1)^(1-gamma)-(m-k-2)^(1-gamma)-(m-k-3)^(1-gamma)+(m-k-4)^(1-gamma),x_Dim,delta_t,gamma)*d(k+2,:)';
    end
    d(m+1,:)=(genMatB(1,x_Dim,(m-1)*delta_t))\(F - genMatB(4,x_Dim,(m-2)*delta_t)*d(m,:)' - genMatB(1,x_Dim,(m-3)*delta_t)*d(m-1,:)');
end

