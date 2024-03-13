
for k=0:0.5:10 

P=[1,2,3,k]; 
r=roots(P); 
R=real(r);
I=imag(r);

plot(R,I,'*')
hold on
end 
