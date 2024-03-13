load('lab6_2.mat');
u1=id.u; 
y1=id.y;

u2=val.u; 
y2=val.y; 

plot(u1)
hold on;
plot(y1)

na=10;
nb=10;
N=length(y1);
M=length(y2);

%partea de identificare+predictie

for i=1:N

    for j=1: na 

        if(i>j)

            phi_id(i,j)= -y1(i-j);
        end
    end



        for j=1 : nb
            
            if(i>j)

            phi_id(i,j+na)=u1(i-j);

            end
        end
    end


theta= phi_id\y1;
ypred_id=phi_id*theta;


figure; 
plot(y1)
hold on; 
plot(ypred_id)
title('Identificare')



%partea de validare+predictie
for k=1:M

    for l=1: na 

        if(k>l)
          
            phi_val(k,l)=-y2(k-l);
        end
    end

        for l= 1 : nb

            if(k>l)

            phi_val(k,l+na)=u2(k-l);

            end
        end
end

teta= phi_val\y2;
ypred_val=phi_val*teta;

figure; 
plot(y2)
hold on; 
plot(ypred_val)
title('Validare')

%simulare

for i = 1 : M
v=zeros(1,20); 

    for j = 1 : na

        if(i>j)

           v(j) = -ysim(i-j);
        end
    end

    for j = 1: nb

        if(i>j)

            v(j+na) = u2(i-j);
        end
    end
    ysim(i) = v * theta;
end


figure
plot(ysim)
hold on;
plot(y2)
hold on; 
plot(ypred_val)

%MSE
s=0;
P=y2-ysim; 
for i=1:length(P)
    s=s+P(i).^2;
end
MSE_val=s/length(P);