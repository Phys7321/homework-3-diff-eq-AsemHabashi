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

% it can be seen that the maximum amplitude occurs at omega=3, which is
% the natural frequency of the pendulum.

%PART(B):

omega = linspace(0,6,30);
gama = [0.1,0.5,1,2];
Amax=zeros(4,1);
delOmega=zeros(4,1);

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
    hold on
    amax=max(Amp);
    Amax(j)=amax;
    %finding delomega for this gamma:
    array1=Amp(1:find(Amp==amax));
    array2=Amp(find(Amp==amax):end);
    array1=abs(amax*1/sqrt(2)-array1);
    array2=abs(amax*1/sqrt(2)-array2);
    omega1_ind=find(array1==min(array1));
    omega2_ind=find(array2==min(array2));
    omega1=omega(omega1_ind);
    omega2=omega(length(array1)+omega2_ind);
    delomega=omega2-omega1;
    delOmega(j)=delomega;
end

title('Amplitude vs omega for different gamma values');
xlabel('omega');
ylabel('Amplitude');
legend('gamma=0.1','gamma=0.5','gamma=1','gamma=2');

Amax
delOmega/2.75

% it can be seen that the maximum amplitudes are : 
% for gamma=0.1: Amax=1.9816    Omegamax=2.69    delomega/omegamax=0.1505
% for gamma=0.5: Amax=0.6856    Omegamax=2.897   delomega/omegamax=0.2257
% for gamma=1:   Amax=0.3402    Omegamax=2.897   delomega/omegamax=0.4514
% for gamma=2:   Amax=0.1769    Omegamax=2.69    delomega/omegamax=0.9028

% it can be seen that Amax decreases with increasing gamma, and that the 
% relation is very near to being an inverse proportionality (for large
% gamma).

% and omega_max is slightly less than 3, between 2.69 and 2.897 depending
% on gamma.

% the ratios of delomega/omegamax are calculated and given above also, and
% it can be seen that the oscillator with gamma=0.1 is the best one as its
% Q (Quality factor) will be maximal ( the resonance is more sharply
% defined).
