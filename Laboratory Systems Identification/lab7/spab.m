%implementat fct spab, de generat intrarea, datele de luat de la un coleg



m_min = 10;
N = 200;
m_max = 3;
a = -0.7;
b = 0.7;
na=2;
nb=2;
nk=4;
u = [zeros(1,10), spab(N, m_min, a, b), zeros(1,10), spab(N, m_max, a, b), zeros(1,10), 0.4*ones(1,70)];
plot(u)

Model1=arx(id1,[na,nb,nk]);
Model2=arx(id2,[na,nb,nk]);
compare(Model1,val) 
compare(Model2,val)


function [u_prim]=spab(N,m_min,a,b)
%x=cell(m+1,1); 
%matrice_x=[1 1 1; 0 1 0; 1 0 1];


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



