%implementat fct spab, de generat intrarea, datele de luat de la un coleg

N = 200;
a = -0.7;
b = 0.7;
m1 = 10;
m = 3;

u_id1 = spab(N, m, a, b);
u_id2 = spab(N, m, a, b);
u_val = [zeros(1, 30), spab(N, m1, a, b), zeros(1, 30), ones(1, 70)*0.4];

y_id1 = vel(30:230);
y_id2 = vel(260:460);
yval = vel(490:end);

u_id1 = u(30:230);
u_id2 = u(260:460);
uval = u(490:end);

id1 = iddata(y_id1', u_id1', t(2) - t(1));
id2 = iddata(y_id2', u_id2', t(2) - t(1));
val = iddata(yval', uval', t(2) - t(1));

na = 15;
nb = 15;
nk = 1;


y_id1 = lsim(arx1, u_id1);
y_id2 = lsim(arx2, u_id2);

y_val1 = lsim(arx1, uval);
y_val2 = lsim(arx2, uval);
y_val = lsim(arx3, uval);

figure
plot(t,vel);


Model1=arx(id1,[na,nb,nk]);
Model2=arx(id2,[na,nb,nk]);
Model3=arx(val,[na,nb,nk]);
compare(Model1,val) 
title('SPAB3')
figure
compare(Model2,val)
title('SPAB10')
u=spab(300,10, 3,4);
compare(Model3,val)
plot(u)

function [u_prim]=spab(N,m_min,a,b)
%x=cell(m+1,1); 
%matrice_x=[1 1 1; 0 1 0; 1 0 1];
A=zeros(1,m_min);

if m_min==3 
    A(1,:)= [1 0 1]; 
elseif m_min==4 
    A(1,:)= [1 0 0 1 ]; 
elseif m_min==5
    A(1,:)= [0 1 0 0 1]; 
elseif m_min==6
    A(1,:)= [1 0 0 0 0 1 ]; 
elseif m_min==7
    A(1,:)= [1 0 0 0 0 0 1]; 
elseif m_min==8
    A(1,:)= [1 1 0 0 0 0 1 1]; 
elseif m_min==9
    A(1,:)= [0 0 0 1 0 0 0 0 1]; 
elseif m_min==10
    A(1,:)= [0 0 1 0 0 0 0 0 0 1]; 
end

    %for i=2:N
    %A(i,i-1)=1;
    %end

  %  for k=1:(m+1)
   % x{k}=matrice_x;

x= ones(1,m_min); 
x_next=zeros(1,m_min);

for k=1:N

    x_next(1)= mod(sum(A.*x),2);
    x_next(2:end)= x(1:end-1);
    u(k)= x_next(1);
    x= x_next;

end 
    u_prim= a+ (b-a)* u;

end



%for i=1:length(m_max)
 %   for j=1:length(m_max)
  %      A(1,j)=a(i);
   % end
%end

    %for j=1:length(m_max)
        
    %end
   

%for K=1:N
%x(k+1)=A.*matrice_x;
%x(k+1)=mod(x(k+1),2);
%for i=1:m
%for i = 1 : m_max
%end



