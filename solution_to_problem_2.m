%omega0=3, and initial theta = 1.5 (large oscillation)
[period,sol,KE,PE,E]=pendulum_modified(3,1.5,0);
%t=sol(:,1);
%x=sol(:,2);
%v=sol(:,3);

figure(1)
plot(sol(:,1),E);
title('Total Energy vs time');
xlabel('t');
ylabel('E');

%In the case of large oscillatios (theta0=1.5): The Energy oscillates 
%during one cycle but its average doesn't drift that much with time, for 
%small oscillation the Energy is more stable.
theta0= [0.1,0.2,0.4,0.8,1];
T_pend=zeros(5,1);
T_SHM=zeros(5,1);
k=1;
figure(2)
for i = 1:5
    theta=theta0(i);
    [period,sol]=pendulum_modified(3,theta,0);
    T_pend(k)=period;
    plot(sol(:,1),sol(:,2));
    hold on;
    period=SHM(3,theta,0);
    T_SHM(k)=period;
    k=k+1;
end

title('angle vs time');
xlabel('t');
ylabel('theta');
legend('0.1','0.2','0.4','0.8','1');

figure(3)
for i = 1:5
    theta=theta0(i);
    [period,sol]=pendulum_modified(3,theta,0);
    plot(sol(:,1),sol(:,3));
    hold on;
end

title('angular velocity vs time');
xlabel('t');
ylabel('theta_dot');
legend('0.1','0.2','0.4','0.8','1');

figure(4)
plot(theta0,T_pend);
hold on;
plot(theta0,T_SHM);
xlabel('theta max');
ylabel('Period (pendulum)');
legend('Pendulum','SHM');


% it can be seen from the 4th plot that the period increases with theta_max
% and that it is always larger than the SHM period for a given initial 
% theta.