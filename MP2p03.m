function MP2p03()

% Solving the ODE for
% 0<t<20 with x1(0)=2.0 x2(0)=1.0
options=odeset('RelTol',1.0e-3);
[t,x]=ode23(@dxdt,[0 20],[2 1],options);
plot(t,x(:,1),'k--',t,x(:,2),'r-')
xlabel('t');
ylabel('x');
legend('x_1(t)','x_2(t)');
axis([0 20 0 6]);


function xp=dxdt(t,x)
xp(1)=1.2*x(1)-0.6*x(1)*x(2);
xp(2)=-0.8*x(2)+0.3*x(1)*x(2);
xp=xp';
