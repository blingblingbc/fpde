function A=genMatA(param,dim,delta_t,gamma)
A=zeros(dim,dim);
if(dim<3)
    fprintf('dim need to be bigger than 2 to create mat A\n');
else
    for i = 2:dim-1
       A(i,i-1)=param/(delta_t^gamma*(2-gamma)*(1-gamma)*sqrt(pi)); 
    end
end
