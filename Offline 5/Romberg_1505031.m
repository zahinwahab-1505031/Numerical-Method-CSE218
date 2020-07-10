function Romberg_1505031(f)
truevalue = 41.17107385;
error = 1;

a =0;
b= 3;
T = zeros(8,8);
j=1;
for i =1:8
    T(i,1) = Trapezoid(f,j,a,b);
    j = j*2;
 
end
k = 2;
err = 100;
while( k<= 8 && err>error)
    for j = 1: 8-k+1
         T(j,k) = ((4^(k-1))*T(j+1,k-1)- T(j,k-1))/((4^(k-1))-1);
    end
      err = abs(( truevalue - T(1,k))*100/truevalue) ;
      display(err)
    k = k+1;
end
display(T)
end