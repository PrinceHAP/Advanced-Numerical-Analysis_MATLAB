function PDE_Ex01()
clc
%  solution of Laplace's equation 
%  -delsq u = 0 **Note - sign 
%  on a unit square with N X N total grid pts
%  the same mesh width in x and y
%  uses sparse storage
%  try to use constructs in delsquare

% set parameters
N=4;
M=N;

% generate grid - uses natural ordering, top to bot, l to r  
G=numgrid('S',N)
% Number of interior points
dof = sum(G(:)>0)

x=linspace(0,1,N);
y=linspace(0,1,M);

% generate matrix and RHS of equation
A = delsq(G)
figure(1)
spy(A)
g=laplacerhs(x,y,N,M)

% use \ to solve matrix equation
u=A\g;
figure(2)
spy(u)
% transform back to u(i,j)
U = G;
U(G>0) = full(u(G(G>0)));
figure(3)
spy(U)
% need to add bdry values before plotting
U(:,1)=gL(fliplr(y)); % L bdry
U(:,N)=gR(fliplr(y)); % R bdry
U(1,:)=gT(x); % T bdry
U(M,:)=gB(x); % B bdry

% need to add intersection boundary corner point values
U(1,1)=mean([gL(1),gT(1)]); % corner pt of L and T bdry intersection
U(1,N)=mean([gR(1),gT(1)]); % corner pt of R and T bdry intersection
U(M,1)=mean([gL(1),gB(1)]); % corner pt of L and B bdry intersection
U(M,N)=mean([gB(1),gR(1)]); % corner pt of B and R bdry intersection
U
% plot solution
figure(4)
surf(x,y,U')

xlabel('x-axis','FontSize',12,'FontWeight','bold')
ylabel('y-axis','FontSize',12,'FontWeight','bold')
zlabel('Solution','FontSize',12,'FontWeight','bold')

% subfunction for constructing RHS
function b=laplacerhs(x,y,N,M)
n=N-2;m=M-2;
dof=n*m;
b=zeros(dof,1);
xint=x(2:N-1);yint=fliplr(y(2:M-1)); % natural ordering
b(1:m)= gL(yint);                    % pts next to L bdry
b(1:m:(n-1)*m+1)= gT(xint);          % pts next to T bdry
b(m:m:dof)= gB(xint);                % pts next to B bdry
b((n-1)*m+1:dof)= gR(yint);          % pts next to R bdry

% All corner nodes have the correct point condition specified  by
%the present BCs. But it should be defined seperately for more general cases.

 b(1)= sum([gL(1),gT(1)]);                  % corner pt of L and T bdry intersection
 b(m)= sum([gL(1),gB(1)]);                  % corner pt of L and B bdry intersection
 b((n-1)*m + 1)= sum([gR(1),gT(1)]);        % corner pt of R and T bdry intersection
 b(dof)= sum([gR(1),gB(1)]);                % corner pt of R and B bdry intersection
% ---------------------------------------------------

% bottom BC function
function g=gB(x)
	g=0;
% ---------------------------------------------------
% left BC function
function g=gL(y)
	g=0;
% ---------------------------------------------------
% right BC function
function g=gR(y)
    g=0;
% ---------------------------------------------------
% top BC function
function g=gT(x)
	g=1;
% ---------------------------------------------------