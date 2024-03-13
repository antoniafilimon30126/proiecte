clear all
close all
clc

uz = zeros(50, 1);
N = 200;
u_step = 0.4 * ones(100, 1);
u_spab = idinput(N, 'prbs', [], [-0.8 0.8]);
uval = [uz; u_step; uz];
uid = [uz; u_spab];
yval = DCMRun.run(uval);
motor = DCMRun.start("port","COM8");

na = 2;
nb = na;
nk = 1;
N = 200;
phi = [];
theta_hat = zeros(na + nb, 1);
delta = 1000;
P = delta * eye(na + nb);

y = zeros(length(uid), 1);
for  k = 1 : N
    y(k) = motor.step(uid(k));
    phi = zeros;
    for i = 1 : na
        if k - i <= 0
            phi(i) = 0;
        else
            phi(i) = -y(k - i);
        end
    end

    for j = 1 : nb
        if k - j <= 0
            phi(na + j) = 0;
        else
            phi(na + j) = uid(k - j);
        end
    end
    phi = phi';

    e(k) = y(k) - phi' * theta_hat;
    P = P - (P * phi * phi' * P) / (1 + phi' * P * phi);
    W = P * phi;
    ww = W * e(k);
    theta_hat = theta_hat + ww;
    if k == 12
        theta = theta_hat;
    end
    motor.wait()
end

motor.stop()

A = [1 theta_hat(1 : na)'];
B = [zeros(1, nk) theta_hat(na + 1 : na + nb)'];
C = [];
D = [];
F = [];
Ts = 0.01;
model = idpoly(A, B, C, D, F, 0, Ts);
modelp = idpoly([1 theta(1 : na)'], [zeros(1, nk) theta(na + 1 : na + nb)'], C, D, F, 0, Ts);
val = iddata(yval', uval, Ts);
compare(model, val)
figure
compare(modelp, val)



