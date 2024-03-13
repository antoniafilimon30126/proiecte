clear all
load('datemotor.mat')

figure; 
plot(u);
title('Semnal u')
figure;
plot(vel);
title('Semnal vel')
u1=u(1:212);
y1=vel(1:212);
u2=u(212:end);
y2=vel(212:end);

nk=2;
Ts=0.01;
alfa=0.2; 
%delta=10e-5;
N=200;
teta = [1; N];
id_model=iddata(y1',u1, Ts);
val_model=iddata(y2',u2, Ts);
uid=id_model.u;
yid=id_model.y;

l=0; %counterul de iteratii

while l<N
    e=zeros(1,N);
    b=teta(2);
    f=teta(1);

for k=1:nk
    e(k)= yid(k);
    deriv_f=zeros(1,N);
    deriv_b=zeros(1,N);
end


for k=nk+1:N
    e(k) = yid(k) + yid(k-1)*f-e(k-1)*f- uid(k-nk)*b;
    deriv_f(k) =  yid(k-1) - deriv_f(k-1)*f - e(k-1);
    deriv_b(k) = -(deriv_b(k-1)*f+ uid(k-nk));

end

    H = zeros; %hessian
    dV = zeros; %gradient

    for k = 1:N

        dV = dV + 2/(N-nk) * (e(k)* [deriv_f(k); deriv_b(k)]);
    end
    
    for k = 1:N

        H = H + 2/(N-nk) * ([deriv_f(k); deriv_b(k)] * [deriv_f(k) deriv_b(k)]);
    end

teta1=teta;
teta=teta1-alfa*inv(H)*dV;
l=l+1;
end

A=1;
B = [0, b];
C=1;
D=1;
F=[1, f];
model=idpoly(A,B,C,D,F,0,Ts);
figure
compare(model,val_model)


%Cod motor
%uz=zeros(10,1);
%uz=uz(:);
%N=200;
%u_spab=idinput(N,'prbs',[],[-0.7,0.7]);
%u_step=0.4*ones(70,1);
%u=[uz;u_spab;uz;u_step];
%[vel,alpha,t]=run(u,'/dev/ttyACM0');
%plot(t,vel)