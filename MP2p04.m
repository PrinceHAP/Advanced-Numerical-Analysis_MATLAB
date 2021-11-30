function MP2p04()

close all
clear all

% Solving the ODE for
% 0<t<4 with x(0)=0.5

%Own Euler Solver
[t1,x1]=MyEuler(@dxdt,[0 4],0.5,1);
[t2,x2]=MyEuler(@dxdt,[0 4],0.5,0.5);
[t3,x3]=MyEuler(@dxdt,[0 4],0.5,0.1);
%Matlab Solver
[tmat,xmat]=ode23(@dxdt,[0 4],0.5);
plot(t1,x1,'k-',t2,x2,'b-',t3,x3,'m-',tmat,xmat,'ro-')
legend('h=1.0','h=0.5','h=0.1','ode23()');
xlabel('t');
ylabel('x');

function [t,x]=MyEuler(ODEfunc,tspan,x0,h)
%This function solves only one ODE.
t=tspan(1):h:tspan(2);
x(1)=x0;
for n=1:length(t)-1
    x(n+1)=x(n)+ODEfunc(t(n),x(n))*h;
end
 
 
function xp=dxdt(t,x)
xp=10*exp(-(t-2)^2/(2*0.075^2))-0.6*x;
