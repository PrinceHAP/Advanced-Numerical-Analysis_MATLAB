function MP3p01()

% Program MP3p01.m
 
% Solving ODE using different Matlab functions
% and compare with exact solution
 
clear all
close all

h=0.002;

 
%Exact solution
texact=linspace(0,4,500);
xexact=3-0.998*exp(-1000*texact)-2.002*exp(-texact);
 
%Solving solution using different ODE
[t1,x1]=ode23(@dxdt,[0, 4],0.0);
[t2,x2]=ode23s(@dxdt,[0, 4],0.0);
[t3,x3]=MyEuler(@dxdt,[0, 4],0.0,h);
[t4,x4]=MyRK4(@dxdt,[0, 4],0.0,h);
 
%Plotting solution
plot(texact,xexact,'k-',t1,x1,'r-', t2,x2,'g-', t3,x3,'b-',t4,x4,'mo-')
axis([0 4  0 3]);
legend('Exact solution','ode23()','ode23s()','MyEuler()','MyRK4')
 
xlabel('t','Fontsize',14);
ylabel('x','Fontsize',14);

function [t,x]=MyEuler(ODEfunc,tspan,x0,h)
%This function solves only one ODE.
t=tspan(1):h:tspan(2);
x(1)=x0;
for n=1:length(t)-1
    x(n+1)=x(n)+ODEfunc(t(n),x(n))*h;
end

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

function xp=dxdt(tn,xn) 
xp=-1000*xn+3000-2000*exp(-tn);


