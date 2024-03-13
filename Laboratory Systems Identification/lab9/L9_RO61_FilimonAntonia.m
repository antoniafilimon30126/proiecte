clear all 
load('datemotor.mat');

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

Ts=0.01;
id_model=iddata(y1',u1, Ts);
val_model=iddata(y2',u2, Ts);
uid=id_model.u;
yid=id_model.y;

na=2;
nb=2;
nk=1;
N=200;

%phi_id=zeros;
%identificare model
%predictia 
model=arx(id_model, [na nb nk]); 
ysim=compare(model, id_model); 
ysim=ysim.Y;
%ypred_id=phi_id*theta;

%ysim=zeros(length(yid),1);
%z=zeros(length(yid), na+nb);

for i=1:length(yid)

    for j=1: na 

        if(i>j)

            phi_id(i,j)= -yid(i-j);
        end
    end

        for j=1 : nb
            
            if(i>j)

            phi_id(i,j+na)=uid(i-j);

            end
        end
    end


for i = 1 : length(yid)
v=zeros(1,20); 

    for j = 1 : na

        if(i>j)

           v(j) = -ysim(i-j);
        end
    end

    for j = 1: nb

        if(i>j)

            v(j+na) = uid(i-j);
        end
    end
    z(i,:)=v; 
end

s=0;     
for k=1:N
    s=s+(z(k,:)'* phi_id(k,:));
end

Phi=(1/N) * s;


s=0;     
for k=1:N
    s=s+(z(k,:).*yid(k,:));
end

Y=(1/N) * s;
%Phi = (1/N)*z'*phi_id;

%Y = sum(z.*yid)*(1/N);
Theta=Phi\Y';

%s=0;     
%for k=1:N
 %   s=s+(z(k,:)*phi_id(k,:)');
%end
%Phi=(1/N) * s;


%s=0;     
%for k=1:N
%    s=s+(z(k,:)*yid(k,:));
%end

%Y=(1/N) * s;

    A=[1, Theta(1:na)']; 
    B=[0, Theta(na+1:na+nb)'];
    C=1;
    D=1;
    F=1;

mod_VI = idpoly(A,B,C,D,F,0,Ts);

%y_aprox2 = lsim(mod_VI,u2);
compare(mod_VI,val_model)

%MSE
s=0;
P=y2-ysim; 
for i=1:length(P)
    s=s+P(i).^2;
end
MSE=s/length(P);

%figure
%plot(y_aprox2, 'r')
%hold on
%plot(y2, 'b')
%title('Semnal yaprox2 si y2')
