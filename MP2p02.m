function MP2p02()
 clc
% Solving the ODE for
% 0<t<4 with x(0)=0.5
[t,x]=ode23(@dxdt,[0 4],0.5);
plot(t,x,'ko-')
xlabel('t');
ylabel('x');
 
 
function xp=dxdt(t,x)
xp=10*exp(-(t-2)^2/(2*0.075^2))-0.6*x;
