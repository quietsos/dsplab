clc;
close all;
clear all;

xn = input('Enter the first sequence : ');
hn = input('Enter the second sequnce : ');
l1 = length(xn); % length of first sequence 
l2 = length(hn); % length of second sequence 
N = max(l1,l2); % Define the length of the output 
xn = [xn, zeros(1,N-l1)]; % zero padding is done to make l1=l2. 
hn = [hn, zeros(1,N-l2)];

xk = zeros(1, N);
for n = 0:N-1
    for k = 0:N-1
        xk(n+1)= xk(n+1) + (xn(k+1)*exp((-i*2*pi*n*k)/N));
    end;
end;
hk = zeros(1, N);
for n = 0:N-1
    for k = 0:N-1
        hk(n+1)= hk(n+1) + (hn(k+1)*exp((-i*2*pi*n*k)/N));
    end;
end;
yk = xk.*hk;

N = length(yk);
yn = zeros(1, N);
for n = 0:N-1
    for k = 0:N-1
        yn(n+1)= yn(n+1) + ((1/N)*(yk(k+1)*exp(((1i)*2*pi*n*k)/N)));
    end;
end;
%yn = ifft(yk, N);
disp('Circular convolution of x(n) and h(n) = ');
disp(yn);

subplot(2,1,2);
stem(real(yn), '*');
xlabel('n');
ylabel('x(n)');
title('plot of x(n)');

subplot(2,2,2);
stem(hn, '*');
xlabel('n');
ylabel('h(n)');
title('plot of h(n)');

subplot(2,2,1);
stem(xn, '*');
xlabel('n');
ylabel('y(n)');
title('Circulr Convolution output');