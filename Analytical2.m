function Analytical2()
clc
clear all
syms y(x)
ode = diff(y,x,2) == 0.01*y -0.2;
cond1= y(0)==40;
cond2= y(10)==200;
conds=[cond1 cond2];
ySol(x)=dsolve(ode,conds)

