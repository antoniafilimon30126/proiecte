clear all;
load('lab3_order1_5.mat')

x1=data.InputData;
y1=data.OutputData; 
plot(x1)
figure
hold on
grid
plot(t,y1)


y01=0.02; 
yss1=2; 
u01=0;
uss1=4; 
t1=0;
t2=3.43; %x de la y1
y1=y01+(yss1-y01)*0.632; 
T1=(t2-t1); 
k1=(yss1-y01)/(uss1-u01);
H=tf(k1,[T1,1]);
yaprox1=lsim(H,x1,t); 
plot(t,y1,t,yaprox1)
N1=length(O);
O=y1-yaprox1;
s1=0;
for i=1:N1

    s1=s1+O(i).^2;
end

MSE1=(1/N1)*(sum(s1)); 


%%

load('lab3_order2_6.mat')
x2=data.InputData;
y2=data.OutputData; 
plot(t,x2)
figure
hold on
grid
plot(t,y2)
y02=0;
yss2=1.06; %acolo unde incepe sa se stabilizeze 
ymax=1.58; %prima oscilatie
ymin=1.18; %a doua oscilatie
umax=0.78; %x de la ymax
umin=2.53; %x de la ymin
u02=0;
uss2=0.5;
k2=(yss2-y02)/(uss2-u02);
M=(ymax-yss2)/yss2;
T=umin-umax;
tita=(-log(M))/sqrt(pi.^2+(log(M))^2);
wn=(2*pi)/(T*sqrt(1-tita^2));
v=wn.^2;
m=2*tita*wn;
l=k2*wn.^2;
H2=tf(l,[1,m,v]);
yaprox2=lsim(H2,x2,t); 
plot(t,[x2,y2,yaprox2])
N2=length(y2);
P=y2-yaprox2;
s2=0;
for i=1:N2

    s2=s2+P(i).^2;
end

MSE2=(1/N2)*(sum(s2)); 
