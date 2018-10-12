%omega0=3, and initial theta = 1.5 (large oscillation)
[period,sol,KE,PE,E]=pendulum_modified(3,1.5,0);
t=sol(:,1);
x=sol(:,2);
v=sol(:,3);

figure(1)
plot(t,E);
title('Total Energy vs time');
xlabel('t');
ylabel('E');

%In the case of large oscillatios (theta0=1.5): The Energy oscillates 
%during one cycle but its average doesn't drift that much with time, for 
%small oscillation the Energy is more stable.
figure(2)
for i = [0.1,0.2,0.4,0.8,1]
    [period,sol]=SHM(3,i,0);
    plot(sol(:,1),sol(:,2));
    hold on;
end

title('angle vs time');
xlabel('t');
ylabel('theta');
legend('0.1','0.2','0.4','0.8','1');

figure(3)
for i = [0.1,0.2,0.4,0.8,1]
    [period,sol]=SHM(3,i,0);
    plot(sol(:,1),sol(:,3));
    hold on;
end

title('angular velocity vs time');
xlabel('t');
ylabel('theta_dot');
legend('0.1','0.2','0.4','0.8','1');

