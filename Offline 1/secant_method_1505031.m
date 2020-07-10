function [xr,it,err] = secant_method(f,x1,x2,error,N)
clc
t=x1:x2:100;
 fplot(f,t);
   title('Graph of f(x) against x')
        xlabel('x')
        ylabel('f(x)') 
 grid on;
 hold on;
xrpp = x1;
xrp = x2;
i=1;
err = 100;

while (i<=N && err>error)
   % xr(i+1) = xr(i) - ((f(xr(i))*(xr(i-1)- xr(i)))/(f(xr(i-1)) - f(xr(i))));
    xr = xrp - ((f(xrp)*(xrpp- xrp))/(f(xrpp) - f(xrp)));
    
    err = abs((xr-xrp)/xrp)*100;
    
    xrpp=xrp;
    xrp=xr;
    i=i+1;
end
it= i-1;
xr
err

end
