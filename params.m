%参数中的函数
function ps=params
   ps.alfa=@alfa;
   ps.P=@P;
   ps.f=@f;
end

function y=alfa()
   y=1;
end
function y=P(x,t)
   y=1;
end
function y=f(x,t)
   y=1;
end