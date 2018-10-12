% SHM with omega0=3, theta0=0.25 and theta0d=0
[period,sol,KE,PE,E]=SHM(3,0.25,0);
t=sol(:,1);
x=sol(:,2);
v=sol(:,3);
delta=(E-E(1))/E(1);

figure(1)
plot(t,delta);
title('delta vs time');
xlabel('t');
ylabel('delta');
figure(2)
plot(t,x);
title('position vs time');
xlabel('t');
ylabel('x');
figure(3)
plot(t,v);
title('velocity vs time')
xlabel('t');
ylabel('v');
figure(4)
plot(t,KE);
title('Kinetic energy vs time');
xlabel('t');
ylabel('KE');
figure(5)
plot(t,PE);
title('Potential energy vs time');
xlabel('t');
ylabel('PE');
figure(6)
plot(t,E);
title('Total Energy vs time');
xlabel('t');
ylabel('E');
% we can see from the plots that the potential energy curve is
% complementary to the kinetic energy curve, so that their sum is
% effectively constant in time.

% we can see also that E is fairly constant in E curve, and the delta vs
% time curve reveals that the change in energy over one cycle is of the
% order of 10^-4 

figure(7)
plot(x,v);
title('phase space');
xlabel('x');
ylabel('v');

% the shape of the phase space trajectory is an ellipse.
