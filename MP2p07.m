function MP2p07()

close all
clear all

% Solving the ODE for
% 0<t<20 with x1(0)=2.0 and x2(0)=1.0

%Own RK4 Solver
[t1,x1]=MyRK4Sys(@dxdt,[0 20],[2 1],0.1);
[t2,x2]=MyRK4Sys(@dxdt,[0 20],[2 1],0.05);
[t3,x3]=MyRK4Sys(@dxdt,[0 20],[2 1],0.01);
%Matlab Solver
[tmat,xmat]=ode23(@dxdt,[0 20],[2 1]);
plot(t1,x1(:,1),'k-',t2,x2(:,1),'b-',t3,x3(:,1),'m-',tmat,xmat(:,1),'ro-')
legend('h=0.1','h=0.05','h=0.01','ode23()');
xlabel('t');
ylabel('x');

function [t,x]=MyRK4Sys(ODEfunc,tspan,x0,h)
%This function uses 4th order Runge-Kutta method to solve a
%system of ODEs
t=tspan(1):h:tspan(2);
x(1,:)=x0;
for n=1:length(t)-1
    k1=ODEfunc(t(n),x(n,:))';
    k2=ODEfunc(t(n)+(h/2),x(n,:)+(h/2)*k1)';
    k3=ODEfunc(t(n)+(h/2),x(n,:)+(h/2)*k2)';
    k4=ODEfunc(t(n)+h,x(n,:)+h*k3)';
    x(n+1,:)=x(n,:)+((1/6)*k1+(1/3)*(k2+k3)+(1/6)*k4)*h;
end
 
 
function xp=dxdt(t,x)
xp(1)=1.2*x(1)-0.6*x(1)*x(2);
xp(2)=-0.8*x(2)+0.3*x(1)*x(2);
xp=xp';