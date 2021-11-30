function MP3p03()
% Program MP3p03.m
% Crank Nicolson to solve stiff problem
 
clear all

h=0.001;
 
%Exact solution
texact=linspace(0,4,500);
xexact=3-0.998*exp(-1000*texact)-2.002*exp(-texact);
 
%Solving solution using different ODE
[t1,x1]=MyCrankNicolson(@dxdt,[0, 4],0.0,h);

 
%Plotting solution
plot(texact,xexact,'k-',t1,x1,'r-')
 
xlabel('t','Fontsize',14);
ylabel('x','Fontsize',14);

function [t,x]=MyCrankNicolson(ODEfunc,tspan,x0,h)
t=tspan(1):h:tspan(2)
x(1)=x0;

for n=1:length(t)-1
    xn=x(n);
    tnp1=t(n+1);
    tn=t(n);
    x(n+1)=fsolve(@(xnp1)CrankNicolsonODEfunc(ODEfunc,tn,tnp1,xn,xnp1,h),x(n));
end

function residual=CrankNicolsonODEfunc(ODE,tn,tnp1,xn,xnp1,h)
residual=xn+(h/2)*(ODE(tnp1,xnp1)+ODE(tn,xn))-xnp1;

function xp=dxdt(tn,xn)
xp=-1000*xn+3000-2000*exp(-tn);
