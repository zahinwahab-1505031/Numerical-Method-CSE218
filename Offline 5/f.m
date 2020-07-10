function [y]= f(x)
%K = 0.05;
%p = 3;
%y = x/(1-x) * sqrt(2*p/(2+x)) - K 
%y = sin(x)
y = x* exp(x)
%y = 0.2 +25*x - 200*(x^2) + 675*(x^3) - 900*(x^4) + 400*(x^5);
end