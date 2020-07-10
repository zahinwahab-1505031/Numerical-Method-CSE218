function Quadratic_spline_interpolation_1505031(A,TestPoints)


%A  = [3 2.5;    4.5 1;    7 2.5;    9 0.5]


[m,n] = size(A);
for i = 1 : m-1
    
   j = (m-1)/i;
   b= zeros(i+1,2);
   b(1,:) = A(1,:);
   p = 1;
   for row = 1:i
       display(row)
       p = p+j;
       b(row+1,:) =A(floor(p),:);
   end 
  
   display(b)
   T = zeros(3*i -1,3*i -1);
   R = zeros(3*i -1,1);
  
   if(i==1) 
       for k = 1:3*i -1
       R(k,1) = b(k,2);
   end
   for row = 1:3*i -1
       for col = 1:3*i -1
           if(col>=row)  T(row,col) = 1;
           else   T(row,col) = b(row,1);
           end
       end
   end
   else
       it = 1;
    for k = 1:2*i
       R(k,1) = b(it,2);
       if (rem(k,2)~=0) it = it+1;
       end
    end
    c = 3;
    it1  = 1;
   for k = 1 : 2*i
       
       if(k<=2) 
               T(k,1) = b(it1,1);
               T(k,2) = 1;
               
       else
           T (k,c) = b(it1,1)*b(it1,1);
           T (k,c+1)=b(it1,1);
           T (k,c+2) = 1;
           if(rem(k,2)==0)
               c = c+3;
           end
          
       end
        if (rem(k,2)~=0)
            it1 = it1+1;
           
        end
       
   end
   itCol= 0  ;
   itRow  = 2;
   for k = (2*i)+1 : (3*i - 1)
            if (itCol==0) 
               % T (k,itCol) = 2*b(itCol+1,1)
                T (k,itCol+1) = 1;
                T (k,itCol+2) = 0;
                T (k,itCol+3) = -2*b(itRow,1);
                T (k,itCol+4) = -1;
                itCol = itCol + 3 ;
                itRow = itRow + 1;
            else
                T (k,itCol) = 2*b(itRow,1);
                T (k,itCol+1) = 1;
                T (k,itCol+2) = 0;
                T (k,itCol+3) = -2*b(itRow,1);
                T (k,itCol+4) = -1;
                itCol = itCol + 3 ;
                itRow = itRow + 1;
            end
       end
   
    
   end
[Coeffs] = GaussPP(T,R) %Gauss_elimination_scaled_partial_pivoting(T,R)
 range2 = 0;
 for range=1: i
     j=1;
   for x = b(range,1):.001: b(range+1,1)
       y(j)= 0;
       Power = 2;
       
          for var = range2:range2+2
            if(var>0)  y(j) = y(j)+ Coeffs(var)*power(x,Power);
            end
              Power = Power - 1;
        end
          j = j+1;
   
    end
   x =b(range,1):.001: b(range+1,1);
   n = length(x)
  % display(y)
  plot(x(1),y(1),'o')
  hold on
  plot(x(n),y(n),'o')
  hold on
    plot(x,y(1,1:n) )
  %  y = zeros(0);
    hold on
    range2 = range2+3;

 end
[m1 n1] = size(TestPoints);  
j=1;

for it = 1:m1
    range2 = 0;
for range=1: i
  
 if TestPoints(it,1)>b(range,1)&& TestPoints(it,1)< b(range+1,1)
   
      y1(j)= 0;
       Power = 2;
       
          for var = range2:range2+2
            if(var>0) 
                y1(j) = y1(j)+ Coeffs(var)*power(TestPoints(it,1),Power);
            end
              Power = Power - 1;
          end
           error(j) = abs((y1(j)- TestPoints(it,2))/TestPoints(it,2))*100;
          j = j+1;
          
 end
 range2 = range2+3;
   
end
 
       
end
%display(y1)
%display(error)
meanError(i) = mean(error);

%plot (TestPoints(:,1),y1,'o')
%hold off;
for it1 = 1:m1
 scatter(TestPoints(it1,1),TestPoints(it1,2))
 end
 hold off
 pause(3)
end
display(meanError)
end