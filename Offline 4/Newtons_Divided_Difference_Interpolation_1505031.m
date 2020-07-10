function Newtons_Divided_Difference_Interpolation_1505031(A ,TestPoints )


[m,n] = size(A);

for i = 1:m-1
   j = (m-1)/i;
   b= zeros(i+1,2);
   b(1,:) = A(1,:);
   p = 1;
   for row = 1:i
       display(row)
       
       p = p+j;
       b(row+1,:) =A(floor(p),:);
   end  
   
   display(b);
 %  plot (b(:,2),b(:,1))
 %  pause(1)
 %  hold on
   T  = zeros(1+i,2+i); % column 2+i
   T(:,1) = b(:,1);
    T(:,2) = b(:,2);
    for col = 3: 2+i
         for row =col-1: 1+i
       T(row,col) = (T (row,col-1) - T(row-1,col-1)) / (T (row,1) - T(row - col +2,1));
   end
    end
   
  % 
  display(T)
    j=1;
    for x = -0.5:.01:1.1
  % for x= -1:.1:1
    factor = 1;
     y(j) = T(1,2);
          for it = 2: 1+i 
              factor = factor*(x - T(it-1,1));
              y(j) = y(j) + T(it,it+1)*factor;

          end
 
     j = j+1;
  
    end
    j=1;
    for x1 = 1:10
           factor = 1;
          y1(j) = T(1,2);
          for it = 2: 1+i 
              factor = factor*(TestPoints(x1,1) - T(it-1,1));
              y1(j) = y1(j) + T(it,it+1)*factor;

          end
          error(j) = abs((y1(j)- TestPoints(x1,2))/TestPoints(x1,2))*100;
 
     j = j+1;
  
    end
   % display(error)
    meanError(i) = mean(error);
 x = -.5:.01:1.1;
% x = -1:.1:1;
 %display(x1)
 %display(y1)
 display(i)
 display('hello')
 plot(x,y)
 hold on
 
 for it1 = 1:10
 scatter(TestPoints(it1,1),TestPoints(it1,2))
 end
 hold off
 pause(2)
  % 
   
end
display(meanError)
end