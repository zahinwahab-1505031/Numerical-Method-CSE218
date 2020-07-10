function [xr,it,err] = false_position_method(f,x1,x2,error,N)
clc
xl =x1;
xu = x2;
err = 100;
i=1;
t=xl:xu:100;
fplot(f,t);
   title('Graph of f(x) against x')
        xlabel('x')
        ylabel('f(x)') 
grid on;
hold on;

xr = xu - f(xu)*(xl- xu)/ (f(xl)- f(xu))
while (i<=N && err>=error)
   if(i==1)
       xrold = 0;
   else xrold= xr;
   end

   xr = xu - f(xu)*(xl- xu)/ (f(xl)- f(xu))
   disp(xr);
    if(sign(f(xr))==sign(f(xl)))
        xl=xr;
    else
        xu=xr;
        
    end
    if(i==1) 
        err = 100;
    else
        err = abs((xr - xrold) / xr) * 100
    end
    
    i=i+1;
 
      
 
   
end
it = i-1;

end
%function [y] = f(x)
%K = 0.05;
%p = 3;
%y = x/(1-x) * sqrt(2*p/(2+x)) - K 
%end