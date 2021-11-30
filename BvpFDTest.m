function BvpFDTest()

%  A driver function for BvpFD.m
%  Developed by Dr.Sumon Saha

% Test Problem
% Differential Equation: y" + y + 1 = 0 
% Boundary conditions: y(0) = y(1) = 0

a = 0; b = 1; alpha = 0; beta = 0;% specify the BCs
N = 4; % Number of segments
f = 0; g = 1;  r = -1;  % specify the ODE

x = linspace(a,b,N+1); % specify the mesh coordinates

%------------------------------------------------------------------%      
exact = cos(x) - (sin(x)*(cos(1) - 1))/sin(1) - 1;  % exact solution
    
yf = BvpFD(f,g,r,a,b,alpha,beta,N) % Finite Difference Solution
%------------------------------------------------------------------%      
% Postpoccessing of FD solution
plot(x,yf,'g-',x,exact,'--');
legend('FD solution','Exact solution');
xlabel('x','fontsize',12);ylabel('y','fontsize',12);
title('Solution by Finite Difference method','fontsize',12);
%------------------------------------------------------------------% 