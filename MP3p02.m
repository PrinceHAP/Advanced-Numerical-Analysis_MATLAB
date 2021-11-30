function MP3p02()
% Program MP3p02.m
 
clear all

h=0.1;
 
%Exact solution
texact=linspace(0,4,500);
xexact=3-0.998*exp(-1000*texact)-2.002*exp(-texact);
 
%Solving solution using different ODE
[t1,x1]=MyImpEuler(@dxdt,[0, 4],0.0,h);

 
%Plotting solution
plot(texact,xexact,'k-',t1,x1,'r-')
 
xlabel('t','Fontsize',14);
ylabel('x','Fontsize',14);

function [t,x]=MyImpEuler(ODEfunc,tspan,x0,h)
t=tspan(1):h:tspan(2)
x(1)=x0;

for n=1:length(t)-1
    xn=x(n);
    tnp1=t(n+1);
    x(n+1)=fsolve(@(xnp1)EulerODEfunc(ODEfunc,tnp1,xn,xnp1,h),x(n));
end

function residual=EulerODEfunc(ODE,tnp1,xn,xnp1,h)
residual=xn+h*ODE(tnp1,xnp1)-xnp1;

function xp=dxdt(tn,xn)
xp=-1000*xn+3000-2000*exp(-tn);
