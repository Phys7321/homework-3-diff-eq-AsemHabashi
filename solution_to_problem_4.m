%PART(A):

[period,sol]=pendulum_driven_damped(3,0.5,2,1,0);
t=sol(:,1);
x=sol(:,2);

figure(1)
plot(t,x);
title('theta vs time for initial conditions (1,0)');
xlabel('time');
ylabel('angle');

% It can be seen that the motion exhibits a transient response to the 
% driving force first and then oscillatory motion is evident with the 
% driving frequency omega=2.

% the period equals 3.1397, and the frequency = 2.0012

[period,sol]=pendulum_driven_damped(3,0.5,2,0,1);
t=sol(:,1);
x=sol(:,2);

figure(2)
plot(t,x);
title('theta vs time for initial conditions (0,1)');
xlabel('time');
ylabel('angle');

% the plot exhibits the same features as the previous one, 
% the period = 3.1416 and the frequency = 2.
% it is also noted that the steady state amplitudes in both cases are equal
% the steady state motion for longer times is independent of initial
% conditions, the transient behavior occurs for less than the first 20
% seconds and then decays with time, and the longer time steady state
% oscillaroty behavior persists, the frequency is the driving frequency.


% PART(B):
[period,sol]=pendulum_driven_damped(3,0.5,1,1,0);
t=sol(:,1);
x=sol(:,2);
period1=period;
frequency1=2*pi/period1;

figure(3)
plot(t,x);
title('part(b): theta vs time for driving freq =1');
xlabel('time');
ylabel('angle');

[period,sol]=pendulum_driven_damped(3,0.5,4,1,0);
t=sol(:,1);
x=sol(:,2);
period4=period;
frequency4=2*pi/period4;

figure(4)
plot(t,x);
title('theta vs time for driving freq =4');
xlabel('time');
ylabel('angle');

sprintf('period1=%d \n freq1=%d \n period4=%d \n freq4=%d',period1,frequency1,period4,frequency4)

%period1= 6.2608 which is near 2*pi, and frequency1 =1.0035
%period4= 1.5706 which is near pi/2, and frequency4 =4.0005

% it is evident that the only parameter that determines the frequency in
% the steady state is the driving frequency omega (for underdamped
% oscillators).


%PART(C):

%since the steady state motion is oscillatory with the same driving
%frequency then it is apparent that it takes that form, in order to
%calculate delta: 

omega=[0,1,2,2.2,2.4,2.6,2.8,3,3.2,3.4];
delta=zeros(10,1);

for i = 1:10
    Omega=omega(i);
    [period,sol]=pendulum_driven_damped(3,0.5,Omega,1,0);
    t=sol(:,1);
    x=sol(:,2);
    ind= find(sol(:,3).*circshift(sol(:,3), [-1 0]) <= 0);
    maximum=length(ind);
    ind = ind(10:maximum);
    t=t(ind);
    deltas=pi*ceil(Omega*t/pi)-Omega*t;
    Delta=mean(deltas)/pi;
    delta(i)=Delta;
end

figure(5)
plot(omega,delta);
title('delta/pi vs omega');
xlabel('omega');
ylabel('delta/pi');
hold on;

for i = 1:10
    Omega=omega(i);
    [period,sol]=pendulum_driven_damped(3,1.5,Omega,1,0);
    t=sol(:,1);
    x=sol(:,2);
    ind= find(sol(:,3).*circshift(sol(:,3), [-1 0]) <= 0);
    maximum=length(ind);
    ind = ind(10:maximum);
    t=t(ind);
    deltas=pi*ceil(Omega*t/pi)-Omega*t;
    Delta=mean(deltas)/pi;
    delta(i)=Delta;
end

plot(omega,delta);
legend('gamma=0.5','gamma=1.5');

% it seems that delta decreases in both cases! I expected that it should
% increase until near omega =3 ( which is omega0) where suddenly jumps near
% pi, but may be the reason is in the non linearity of the pendulum !? 



