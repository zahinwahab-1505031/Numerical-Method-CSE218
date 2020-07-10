function [x] = LP_Simplex_2_1505031(A,C)
%A = [-1.75 -1.25 0 0 0 0 0 ;1.2 2.25 1 0 0 14 0 ;1 1.1 0 1 0 8 0 ;2.5 1 0 0 1 9 0 ]
%A = [-150 -175 0 0 0 0 0 0;     7 11 1 0 0 0 77 0;     10 8 0 1 0 0 80 0;     1 0 0 0 1 0 9 0;      0 1 0 0 0 1 6 0]
%A = [-6 -8 0 0 0 0 0;5 2 1 0 0 40 0;6 6 0 1 0 60 0;2 4 0 0 1 32 0]

[m,n] = size(A)
iter = 1
%C = [1.75 1.25 0 0 0]
m2 = length(C)
CB1 = C(1,3:m2)
CB = transpose(CB1)
while(true)
    display(iter)
    if ( any(A(1,1:n-2)<0))
[p q]= min (A(1,1:n-2))
display('min element at pos')
display(p)
display(q)
for k = 2:m
        A(k,n)= A(k,n-1)/A(k,q)
end
display('after getting ratio')
%[p1 q1] = min(A(2:m,n))
minVal = 9999
index = -1
for i= 2:m
    if(A(i,n)>0 && A(i,n)< minVal )
        minVal =  A(i,n)
        index = i
        
    end
end

keyElement = A (index,q)
CB(index,1) = C(1,q)
display('key element')
display (keyElement)
A(index,:) = A(index,:)/keyElement
  for it=1:m
                if it~=index
                    factor=A(it,q)/A(index,q);
                    A(it,1:n-1)=A(it,1:n-1)-factor*A(index,1:n-1);
                end
            end
display(A)
display('iteration ends')
iter = iter+1;
    
    else break;
end
end
[m1,n1] = size(CB)
for it5=1:2
for it6=1:m1
   if( CB(it6,1)==C(1,it5)) x(it5)= A(it6,n-1)
   end
end
end
Zmax = C(1)*x(1) + C(2)*x(2)
display(Zmax)
end