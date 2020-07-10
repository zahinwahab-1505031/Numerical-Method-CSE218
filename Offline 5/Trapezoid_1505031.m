function [y] = Trapezoid_1505031(f,n,a,b)
h = (b-a)/n;
x = a:h:b;
sum = f(x(1));
for i = 2:n
    sum = sum + 2*f(x(i));
end
sum =sum + f(x(n+1));
y = (sum*h)/2;
end