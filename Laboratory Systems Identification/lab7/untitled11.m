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