function LP_graph1505031
x = 0:15
y = (14-1.2*x)/2.25
set(gca,'xtick',[0:0.50:15]);
 set(gca,'ytick',[-20:0.5:20]);
plot(x,y,'g')
grid on
hold on

x = 0:10
y = (8-x)/1.1
plot(x,y,'r')
hold on
x = 0:10
y = (9-2.5*x)
plot(x,y,'y')
hold on
%1.2x + 2.25y ? 14
%x + 1.1y ? 8
%2.5x + y ? 9
A = [1.2 2.25;1 1.1]
B = [14;8]
p = zeros(2,1)
q = zeros(2,1)
[p]=  LU_Decomposition_with_pivoting_1505031(A,B);
plot (p(1,1),p(2,1),'o')
hold on
A = [1.2 2.25;2.5 1]
B = [14;9]
p = zeros(2,1)
q = zeros(2,1)
[p]=  LU_Decomposition_with_pivoting_1505031(A,B);
plot (p(1,1),p(2,1),'o')
hold on
A = [1 1.1;2.5 1]
B = [8;9]
p = zeros(2,1)
q = zeros(2,1)
[p]=  LU_Decomposition_with_pivoting_1505031(A,B);
plot (p(1,1),p(2,1),'o')
hold on
A = [-1.75 -1.25 0 0 0 0 0 ;1.2 2.25 1 0 0 14 0 ;1 1.1 0 1 0 8 0 ;2.5 1 0 0 1 9 0 ]
C = [1.75 1.25 0 0 0]
[q] = LP_Simplex_2(A,C)
%plot (q(1,1),q(1,2),'o')
end