function y = BvpFD(f,g,r,a,b,alpha,beta,N)

% Solves a Linear 2nd order BVP with Dirichlet BCs, using standard 
% central (2nd Order FD) difference formulae

% Developed by Dr. Sumon Saha

% Linear BVP : y" + f(x)y'(x) + g(x)y = r(x)
% Boundary Conditions: u(a) = alpha; u(b) = beta
%
% Inputs:   f(function): coefficient of y' as a function of x on LHS of BVP
%           g(function): coefficient of y as a function of x on LHS of BVP
%           r (function): function of x on RHS of BVP

%           a,b (scalar):   define the interval [a,b]
%           alpha, beta (scalar):  define the Dirichlet BCs
%           N (scalar):   the number of uniform subintervals in [a,b]
%
% Output:   y (column vector): the solution at the grid points
%                               x=linspace(a,b,N+1)

h=(b-a)/N;

A=zeros(N-1,N-1); % pre-allocate arrays
rs=zeros(N-1,1);

D=ones(1,N-1).*(-2+h^2*g);
Dm1=ones(1,N-2).*(1-h*f/2);
Dp1=ones(1,N-2).*(1+h*f/2);

A=(diag(D)+diag(Dm1,-1)+diag(Dp1,1)); % A tridiagonal

rs=ones(N-1,1).*r*h^2;
rs(1)=rs(1)-alpha.*(1-h*f/2);
rs(end)=rs(end)-beta.*(1+h*f/2); % fix RHS

y=A\rs;
y=[alpha;y;beta];  % add Dirichlet BCs