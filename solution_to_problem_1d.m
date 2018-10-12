%solution to problem 1 part d:

x0=linspace(0.1,1,5);
figure(1)

for i = 1:5
    [period,sol]=SHM(3,x0(i),0);
    plot(sol(:,2),sol(:,3));
    hold on;
end

title('phase space for different initial x0');
xlabel('x');
ylabel('v');
legend('0.1','0.2','0.3','0.4','0.5');

v0=linspace(1,5,5);
figure(2)

for i = 1:5
    [period,sol]=SHM(3,1,v0(i));
    plot(sol(:,2),sol(:,3));
    hold on;
end

title('phase space for different initial v0');
xlabel('x');
ylabel('v');
legend('1','2','3','4','5');

% the trajectories are all ellipses, the total Energy is what determines
% the trajectory irrespective of initial conditions (of course the initial
% conditions are what determines the total Energy) 

% the motion is always clockwise in phase space 

