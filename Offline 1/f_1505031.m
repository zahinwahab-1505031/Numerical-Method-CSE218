function [y]= f(x)
K = 0.05;
p = 3;
y = x/(1-x) * sqrt(2*p/(2+x)) - K 

end