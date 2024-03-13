load('lab5_5.mat')
u1=id.u;
y1=id.y;

u2=val.u; 
y2=val.y; 


plot(tid,u1)
figure 
hold on 
plot(tid,y1)


timp=6*tval;


ymedie=detrend(y1,0); 
umedie=detrend(u1,0);


plot(ymedie)
figure
hold on 
plot(umedie)


M=length(umedie); 
n=50;
N=length(ymedie);


for tau = 1: N


%covariantele

%for i = 0 : (N-1)

    s1=0;

    for k = 1 : N-tau

        s1=s1+ umedie(k+tau-1)*umedie(k); 

    end

        ru(tau)=s1/N; 


    s2=0;

    for k= 1 : N-tau
        s2=s2+ymedie(k+tau-1)*umedie(k);
    
    end

        ryu(tau)=(1/N)*(s2); 
end 
%end


%formare matrice

    %for n = 1 : 50
    for i= 1 : N
    for j= 1: n
        Ru(i,j) = ru(abs(i-j)+1); 

end
end
    %end

H= Ru\ryu'; 

figure
plot(H)

yaprox=conv(H,u2);
yaprox=yaprox(1:length(u2));


figure
plot(yaprox)
hold on;
plot(y2)


%calcul MSE

%L=length(y2);
L=y2-yaprox;


    s3=0;

for i=1:length(L)
    
    s3=s3+L(i).^2;
end

MSE=s3/length(L);

