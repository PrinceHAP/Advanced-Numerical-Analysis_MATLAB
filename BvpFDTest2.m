function BvpFDTest2()

%  A driver function for BvpFD.m
%  Developed by Dr.Sumon Saha

% Test Problem
% Differential Equation: T" -0.01 T + 0.2 = 0 
% Boundary conditions: T(0) = 40, T(10) = 200

a = 0; b = 10; alpha = 40; beta = 200;% specify the BCs
N = 5; % Number of segments
f = 0; g = -0.01;  r = -0.2;  % specify the ODE

x = linspace(a,b,N+1); % specify the mesh coordinates

%------------------------------------------------------------------%      
exact = (20*exp(x/10)*(9*exp(1) - 1))/(exp(2) - 1) - (20*exp(-x/10)*(9*exp(1) - exp(2)))/(exp(2) - 1) + 20;  % exact solution
    
yf = BvpFD(f,g,r,a,b,alpha,beta,N) % Finite Difference Solution
%------------------------------------------------------------------%      
% Postpoccessing of FD solution
plot(x,yf,'g-',x,exact,'--');
legend('FD solution','Exact solution');
xlabel('x','fontsize',12);ylabel('T','fontsize',12);
title('Solution by Finite Difference method','fontsize',12);
%------------------------------------------------------------------% 