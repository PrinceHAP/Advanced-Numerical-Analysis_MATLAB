function MP2p05()

close all
clear all

% Solving the ODE for
% 0<t<4 with x(0)=0.5

%Own RK4 Solver
[t1,x1]=MyRK4(@dxdt,[0 4],0.5,1);
[t2,x2]=MyRK4(@dxdt,[0 4],0.5,0.5);
[t3,x3]=MyRK4(@dxdt,[0 4],0.5,0.1);
%Matlab Solver
[tmat,xmat]=ode23(@dxdt,[0 4],0.5);
plot(t1,x1,'k-',t2,x2,'b-',t3,x3,'m-',tmat,xmat,'ro-')
legend('h=1.0','h=0.5','h=0.1','ode23()');
xlabel('t');
ylabel('x');

function [t,x]=MyRK4(ODEfunc,tspan,x0,h)
%This function assumes you are only solving
%one ODE.
t=tspan(1):h:tspan(2);
x(1)=x0;
for n=1:length(t)-1
    k1=ODEfunc(t(n),x(n));
    k2=ODEfunc(t(n)+(h/2),x(n)+(h/2)*k1);
    k3=ODEfunc(t(n)+(h/2),x(n)+(h/2)*k2);
    k4=ODEfunc(t(n)+h,x(n)+h*k3);
    x(n+1)=x(n)+((1/6)*k1+(1/3)*(k2+k3)+(1/6)*k4)*h;
end
 
 
function xp=dxdt(t,x)
xp=10*exp(-(t-2)^2/(2*0.075^2))-0.6*x;


