clc; % clear screen 
clear all; % clear work space 
close all; % close all figure windows 
xn = input('enter the first sequence x(n) = '); % first sequence 
hn = input('enter the second sequence h(n) = '); % second sequence


N = length(xn)+length(hn)-1; % length of output 
%Xk = fft(xn,N); % N point DFT of first sequence
xk = zeros(1, N);
for n = 0:N-1
    for k = 0:length(xn)-1
        xk(n+1)= xk(n+1) + (xn(k+1)*exp((-i*2*pi*n*k)/N));
    end;
end;
%Hk = fft(hn,N); % N point DFT of second sequence
hk = zeros(1, N);
for n = 0:N-1
    for k = 0:length(xn)-1
        hk(n+1)= hk(n+1) + (hn(k+1)*exp((-i*2*pi*n*k)/N));
    end;
end;
Yk = xk.*hk; % multiplication of DFTs of first and second sequence 
%yn = ifft(Yk,N); % take inverse DFT 
N = length(Yk);
yn = zeros(1, N);
for n = 0:N-1
    for k = 0:N-1
        yn(n+1)= yn(n+1) + ((1/N)*(Yk(k+1)*exp(((1i)*2*pi*n*k)/N)));
    end;
end;
disp('Linear convolution of x(n) and h(n) ='); 
disp(real(yn)); % display the output 
subplot(2,2,1); % graphical display of first sequence 
stem(xn);
xlabel('n'); 
ylabel('x(n)'); 
title('plot of x(n)'); 
subplot(2,2,2); % graphical display of second sequence
stem(hn); 
xlabel('n'); 
ylabel('h(n)'); 
title('plot of h(n)'); 
subplot(2,2,3); % graphical display of output sequence
stem(real(yn)); 
xlabel('n'); 
ylabel('y(n)'); 
title('Convolution Output'); 

yv =conv(xn,hn); % verification of linear convolution 
disp('Convolution in time domain = '); 
disp(yv); 
subplot(2,2,4); % graphical display of output sequence
stem(yv); 
xlabel('n'); 
ylabel('yv(n)'); 
title('Verified convolution output');