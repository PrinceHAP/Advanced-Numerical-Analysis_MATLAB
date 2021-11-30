function Analytical4()
clc
clear all
syms y(x)
Dy = diff(y);
ode = diff(y,x,2) == x.*y;
cond1= y(0)+ Dy(0)==1;
cond2= y(1)==1;
conds=[cond1 cond2];
ySol(x)=dsolve(ode,conds)

