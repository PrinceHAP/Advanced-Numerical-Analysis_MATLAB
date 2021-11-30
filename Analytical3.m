function Analytical3()
clc
clear all
syms y(x)
Dy = diff(y);
ode = diff(y,x,2) == 0.01*y -0.2;
cond1= Dy(0)==12.5;
cond2= y(10)==200;
conds=[cond1 cond2];
ySol(x)=dsolve(ode,conds)

