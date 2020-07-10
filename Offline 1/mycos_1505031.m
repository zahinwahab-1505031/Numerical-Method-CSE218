function [sumresult]=mycos2(x,n)

clc


N=length(x);
N1= length(n);
disp(N1);
sumresult = [N1,N];
for k=1:N1
    disp(n(k));
    j=1;
    while(j<=N)
        sumresult(k,j) = 1.0;
        term =1.0;
        sign =1;
        disp(j);
        for i=3:2:(2*n(k)-1) 
               
                term=term*(x(j)*x(j))/((i-1)*(i-2));
                sumresult(k,j)=sumresult(k,j)-sign*term;
                sign=sign*(-1);
        end
       disp(sumresult(k,j));
            j=j+1;
    end
end
plot(x,sumresult(1,:),'c',x,sumresult(2,:),'r',x,sumresult(3,:),'g',x,sumresult(4,:),'y',x,cos(x),'o')
  title('Graph of cos(x) against x')
        xlabel('x')
        ylabel('cos(x)') 
figure
        
        error = [];
        sign =1;
        j=1;
        for i=1:2:(2*50-1) 
            disp(i);
              if(i==1)
                  term =1.0;
                  result = 1.0;
                  error(j)= 100;
                  j=j+1;
              else
                  prevresult = result;
                term=term*(1.5*1.5)/((i-1)*(i-2));
                result=result-sign*term;
                sign=sign*(-1);
                error(j) = (result - prevresult)*100/result;
                error(j) = abs(error(j));
                j=j+1;
              end
        end
        disp(error);
    
      plot([2:50],error(2:end))
  %    plot([1:50],error)
        title('Graph of relative approximation error against no.of iterations')
        xlabel('number of iterations')
        ylabel('relative approximation error') 
end