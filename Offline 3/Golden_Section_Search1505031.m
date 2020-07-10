function xopt=  Golden_Section_Search1505031 ()
xlow = -1
xupper = 3
%xlow = 0
%xupper = 4
f = @(x) x- exp(x)
%f = @(x) 2*sin(x) - x^2/10
es = 0.0005
goldenRatio = (sqrt(5)-1)/2;
d = goldenRatio*(xupper-xlow)
x1 = xlow + d
x2 = xupper - d 
p = f(x1)
q = f(x2)
it =1    
while(true)
  
    if(q>p)
        xupper = x1
        x1 = x2
        p = q
        
        d = goldenRatio*(xupper-xlow)
        x2 = xupper - d;
        q = f(x2)
    else if (p>q)
            xlow = x2;
            x2 = x1;
            q = p
             d = goldenRatio*(xupper-xlow)
             x1= xlow+d
             p = f(x1)
        end
      
      it = it+1
          if(p>q) xopt = x1
        fx = p
    else if(q<p) xopt = x2
            fx = q
        end
        if(abs(xupper-xlow)<es)  break
      end
          end
    %display(it)
end
end