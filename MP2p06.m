function MP2p06()

close all
clear all

% Solving the ODE for
% 0<t<20 with x1(0)=2.0 and x2(0)=1.0

%Own Euler Solver
[t1,x1]=MyEulerSys(@dxdt,[0 20],[2 1],0.1);
[t2,x2]=MyEulerSys(@dxdt,[0 20],[2 1],0.05);
[t3,x3]=MyEulerSys(@dxdt,[0 20],[2 1],0.01);
%Matlab Solver
[tmat,xmat]=ode23(@dxdt,[0 20],[2 1]);
plot(t1,x1(:,1),'k-',t2,x2(:,1),'b-',t3,x3(:,1),'m-',tmat,xmat(:,1),'ro-')
legend('h=0.1','h=0.05','h=0.01','ode23()');
xlabel('t');
ylabel('x');


function [t,x]=MyEulerSys(ODEfunc,tspan,x0,h)
%This function uses Euler method to solve a
%system of ODEs
t=tspan(1):h:tspan(2);
x(1,:)=x0;
for n=1:length(t)-1
    x(n+1,:)=x(n,:)+ODEfunc(t(n),x(n,:))'*h;
end
 
 
function xp=dxdt(t,x)
xp(1)=1.2*x(1)-0.6*x(1)*x(2);
xp(2)=-0.8*x(2)+0.3*x(1)*x(2);
xp=xp';