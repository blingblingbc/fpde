function u=main(x_Dim,t_Dim,gamma)
%根据d生成u（t，x）矩阵
d=genMatD(x_Dim,t_Dim,gamma);
u=zeros(t_Dim,x_Dim);
for i = 1:t_Dim
   for j = 2:x_Dim-1
       u(i,j)=d(i,j)+4*d(i+1,j)+d(i+2,j);
   end
end
for i = 1:t_Dim
    u(i,1)=left_boun((i-1)/(t_Dim-1));
    u(i,x_Dim)=right_boun((i-1)/(t_Dim-1));
end
