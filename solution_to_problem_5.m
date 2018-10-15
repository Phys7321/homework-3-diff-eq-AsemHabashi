%PART(A);

omega=[0,1,2,2.2,2.4,2.6,2.8,3,3.2,3.4];
Amp=zeros(10,1);

for i=1:10
    Omega=omega(i);
    [period,sol]=pendulum_driven_damped(3,0.5,Omega,0,0);
    t=sol(:,1);
    x=sol(:,2);
    if Omega~=0
        time=floor(5*2*pi/Omega);
    else
        time=10;
    end
    index=find(t>=time);
    x=x(index);
    A=max(x,[],'all');
    Amp(i)=A;
end

figure(1)
plot(omega,Amp);
title('Amplitude vs omega');
xlabel('omega');
ylabel('Amplitude');

% it can be seen that the maximum amplitude occurse at omega=3, which is
% the natural frequency of the pendulum.

%PART(B):

omega = linspace(0,6,30);
gama = [0.1,0.5,1,2];

figure(2)
for j=1:4
    Gama=gama(j);
    Amp=zeros(10,1);

    for i=1:30
        Omega=omega(i);
        [period,sol]=pendulum_driven_damped(3,Gama,Omega,0,0);
        t=sol(:,1);
        x=sol(:,2);
        if Omega~=0
            time=floor(5*2*pi/Omega);
        else
            time=10;
        end
        index=find(t>=time);
        x=x(index);
        A=max(x,[],'all');
        Amp(i)=A;
    end
    plot(omega,Amp);
end

title('Amplitude vs omega for different gamma values');
xlabel('omega');
ylabel('Amplitude');
legend('gamma=0.1','gamma=0.5','gamma=1','gamma=2');

