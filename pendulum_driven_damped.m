function [period,sol,KE,PE,E] = pendulum_damped(omega0,gama,omega,theta0,thetad0,grph) 
% Finds the period of a nonlinear damped pendulum given the length of the 
% pendulum arm and initial conditions. All angles in radians.

%Setting initial conditions
if nargin==0
    error('Must input length and initial conditions')
end
if nargin==1
   theta0 = pi/2;
   thetad0=0;
   grph=0;
end
if nargin==2
    thetad0 = 0;
    grph=1;
end
if nargin==3
    grph=1;
end
if nargin==4
    grph=1;
end
if nargin==5
    grph=1;
end

m=1;
g=9.81;
R=g/omega0^2;
%omega = sqrt(g/R);
T= 2*pi/omega0;
% number of oscillations to graph
N = 1000;


tspan = [0 N*T];
%opts = odeset('events',@events,'refine',6); %Here for future event finder
opts = odeset('refine',6);
r0 = [theta0 thetad0];
[t,w] = ode45(@proj,tspan,r0,opts,g,R,gama,m,omega);
sol = [t,w];
ind= find(w(:,2).*circshift(w(:,2), [-1 0]) <= 0);
%this is to neglect the initial part of the time series as they contain 
%transient response segments:
maximum=length(ind);
ind = ind(10:maximum);
period= 2*mean(diff(t(ind)));

% Small-angle approximation solution
delta = atan(theta0/(omega0*thetad0));
y = theta0*sin(omega0*t+delta);

grph=0;
if grph % Plot Solutions of exact and small angle
    subplot(2,1,1)
    plot(t,w(:,1),'k-',t,y,'b--')
    legend('Exact','Small Angle')
    title('Exact vs Approximate Solutions')
    xlabel('t')
    ylabel('\phi')
    subplot(2,1,2)
    plot(t,w(:,1)-y,'k-')
    title('Difference between Exact and Approximate')
    xlabel('t')
    ylabel( '\Delta\phi')
end

%this is to output a reasonable number of cycles:
time=floor(100*T);
index=find(t<=time);
index=max(index);
sol=sol(1:index,1:3);

KE=0.5*m*R^2.*sol(:,3).*sol(:,3);
PE=m*g*R*(1-cos(sol(:,2)));
E=KE+PE;

   
end
%-------------------------------------------
%
function rdot = proj(t,r,g,R,gama,m,omega)
    rdot = [r(2); cos(omega*t)-gama/m*r(2)-g/R*sin(r(1))];
end

