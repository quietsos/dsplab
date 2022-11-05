clc;
close all;
clear all;

ratio = input('Enter Ratio of Sampling : ' )'

f1=5;

% Oginal Signal
fs=100;
Ts=1/fs;
t=0:Ts:1;
xt=cos(2*pi*f1*t)
subplot(3,1,1);
plot(t,xt)
grid on;
xlabel('time, t');
ylabel('Amplitude');
title('Orginal Signal');

% Samplin Signal
fs=ratio*f1;
Tn=1/fs;
tn=0:Tn:1;
xn=cos(2*pi*f1*tn)
hold on
subplot(3,1,2);
stem(tn, xn)
grid on;
xlabel('time, tn');
ylabel('Amplitude');
title('Sampling');

% Reconstruction of Signal
m = 0:length(xn)-1;
y = zeros(1, length(t));
for i = 1:length(t)
    h = sinc((t(i)-m*Tn)/Tn);
    y(i) = sum(xn .* h);
end
subplot(3,1,3);
plot(t,y);
grid on;
xlabel('time, t');
ylabel('Amplitude');
title('Reconstructed signal');

