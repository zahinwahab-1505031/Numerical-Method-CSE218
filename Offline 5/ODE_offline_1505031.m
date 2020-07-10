function ODE_offline_1505031
a=0;
b=4;
h=0.5;
x= a:h:b;
n= length(x);
functn = @(x)(x^4)-5*(x^2)+3*x-1; % -.5*(t^4)+4*(t^3) - 10*(t^2) + 8.5*t +1
 
fplot (functn,[0 4])
grid on;
hold on;
%euler
y(1) = -1 %needs to be changed
for i=1:n-1
    y(i+1) = y(i) + f2(x(i))*h;
end
%plot(x,y,'o')
%hold on;
plot(x,y,'c')
hold on;

%heun
y(1) = -1 %needs to be changed
for i=1:n-1
    k1 =  f2(x(i));
    k2 =  f2(x(i)+h);
    y(i+1) = y(i) + (k1+k2)*(h/2);
end

plot(x,y,'y')
hold on;
%mid-point
y(1) = -1 %needs to be changed
for i=1:n-1
    k1 = f2(x(i));
    k2 = f2(x(i)+0.5*h)
    y(i+1) = y(i) + (k2)*(h);
end

plot(x,y,'g')
hold on;
%ratson
y(1) = -1 %needs to be changed
for i=1:n-1
    k1 = f2(x(i));
    k2 = f2(x(i)+0.75*h)
    y(i+1) = y(i) + (k1+2*k2)*(h/3);
end

plot(x,y,'r')
hold on;
end