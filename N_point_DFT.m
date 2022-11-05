clc;
close all;
clear all;
N = input('Enter the N point = ');
xn = input('Enter the input sequence x(n) = ');
xk = zeros(1, N);
for n = 0:N-1
    for k = 0:N-1
        xk(n+1)= xk(n+1) + (xn(k+1)*exp((-i*2*pi*n*k)/N));
    end;
end;
disp('N point DFT of x(n) is = ');
disp(xk);
figure(1);
n = 0:1:length(xn)-1;
stem(n, xn, '*');
xlabel('n');
ylabel('x(n)');
title('Orginal signal');

figure(2);
k = 0:N-1
stem(k, abs(xk));
xlabel('k');
ylabel('|x(k)|');
title('Magnitude spectum');

figure(3);
k = 0:N-1
stem(k, angle(xk), '*');
xlabel('k');
ylabel('<x(k)');
title('Phase spectum');

