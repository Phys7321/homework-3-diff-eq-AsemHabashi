[period,sol]=pendulum_damped(3,0.5,1,0);
t=sol(:,1);
x=sol(:,2);
v=sol(:,3);

figure(1)
plot(t,x);
xlabel('time');
ylabel('theta');
title('part(a):angle vs time');

figure(2)
plot(t,v);
xlabel('time');
ylabel('angular velocity');
title('part(a):angular velocity vs time');

gama= [0.5,1,2,3];
T_pend_damp=zeros(4,1);
T_pend=zeros(4,1);
avgKE_pend_damp=zeros(4,1);
avgKE_pend=zeros(4,1);
avgPE_pend_damp=zeros(4,1);
avgPE_pend=zeros(4,1);
avgE_pend_damp=zeros(4,1);
avgE_pend=zeros(4,1);

figure(3)
for i = 1:4
    gama0=gama(i);
    [period,sol,KE,PE,E]=pendulum_damped(3,gama0,1,0);
    T_pend_damp(i)=period;
    ind= find(sol(:,2).*circshift(sol(:,2),[-1,0]) <= 0);
    ind=min(ind);
    KE=KE(1:ind);
    avgKE=mean(KE);
    avgKE_pend_damp(i)=avgKE;
    ind= find(sol(:,2).*circshift(sol(:,2),[-1,0]) <= 0);
    ind=min(ind);
    PE=PE(1:ind);
    avgPE=mean(PE);
    avgPE_pend_damp(i)=avgPE;
    ind= find(sol(:,2).*circshift(sol(:,2),[-1,0]) <= 0);
    ind=min(ind);
    E=E(1:ind);
    avgE=mean(E);
    avgE_pend_damp(i)=avgE;
    plot(sol(:,1),sol(:,2));
    hold on;
    [period,sol,KE,PE,E]=pendulum_modified(3,1,0);
    ind= find(sol(:,2).*circshift(sol(:,2),[-1,0]) <= 0);
    ind=min(ind);
    KE=KE(1:ind);
    avgKE=mean(KE);
    avgKE_pend(i)=avgKE;
    ind= find(sol(:,2).*circshift(sol(:,2),[-1,0]) <= 0);
    ind=min(ind);
    PE=PE(1:ind);
    avgPE=mean(PE);
    avgPE_pend(i)=avgPE;
    ind= find(sol(:,2).*circshift(sol(:,2),[-1,0]) <= 0);
    ind=min(ind);
    E=E(1:ind);
    avgE=mean(E);
    avgE_pend(i)=avgE;
    T_pend(i)=period;
end

title('part(b): angle vs time');
xlabel('t');
ylabel('theta');
legend('0.5','1','2','3');

freq1=2*pi./T_pend_damp;
freq2=2*pi./T_pend;

figure(4)
plot(gama,freq1);
hold on;
plot(gama,freq2);
title('part(b): gamma vs frequency');
xlabel('damping coefficient');
ylabel('frequency');
legend('damped','non damped');

%part(c): computing the average energies: 

figure(5)
plot(gama,avgKE_pend_damp);
hold on;
plot(gama,avgKE_pend);
hold on;
plot(gama,avgPE_pend_damp);
hold on;
plot(gama,avgPE_pend);
hold on;
plot(gama,avgE_pend_damp);
hold on;
plot(gama,avgE_pend);
title('average energies for damped vs undamped pendulum');
xlabel('damping coefficient');
ylabel('Energy');
legend('avgKE_damp','avgKE_nondamp','avgPE_damp','avgPE_nondamp','avgE_damp','avgE_nondamp');

%need to check why the energies for the nondamped case differ!!! 

%part(d):

gama=[4 5 6 7 8];

figure(6)
for i = 1:5
    gama0=gama(i);
    [period,sol]=pendulum_damped_eventsadded(3,gama0,1,0);
    plot(sol(:,1),sol(:,2));
    hold on;
end
title('part(d): angle vs time for damped pendulum');
xlabel('time');
ylabel('angle');
legend('gamma=4','gamma=5','gamma=6','gamma=7','gamma=8');

figure(7)
for i = 1:5
    gama0=gama(i);
    [period,sol]=pendulum_damped_eventsadded(3,gama0,1,0);
    plot(sol(:,1),sol(:,3));
    hold on;
end
title('part(d): angular velocity vs time for damped pendulum');
xlabel('time');
ylabel('angular velocity');
legend('gamma=4','gamma=5','gamma=6','gamma=7','gamma=8');