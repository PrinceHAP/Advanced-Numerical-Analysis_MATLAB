function Analytical()
clc
clear all
syms y(x)
ode = diff(y,x,2) == -y -1;
cond1= y(0)==0;
cond2= y(1)==0;
conds=[cond1 cond2];
ySol(x)=dsolve(ode,conds)