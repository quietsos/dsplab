clc;
close all;
clear all;
ration = input('Enter the Ration : ');
n = 120;
f = 10; % signal's frequency
t = 1/n*(0:1:119);
x = 10* sin(2*pi*f*t); %signal
subplot(3,1,1);
plot(t, x);
grid on;
xlabel('Time, t');
ylabel('Amplitude');
title('Orginal Signal x(t)');

xf = fft(x); % Fourier transform of the signal
disp(length(xf));
freq = (-n/2:n/2-1);
fs = ration*f; %sampling frequency

% Low pass fiter with cutoff frequency fs/2
flf = [zeros(1, 0.5*(length(t)-fs)) ones(1,fs+1) zeros(1, 0.5*(length(t)-fs)-1)];
%disp(length(ones(1,fs+1)));

subplot(3,1,2);
plot(freq, flf, 'linewidth', 2);
axis([-20 20 0 1]);
grid on;
xlabel('Frequency, Hz');
ylabel('Magnitude, |fft(lpf)|');
title('Frequency response of filter');



%multiplication of frequency domain
kf = fftshift(flf).*xf; %Shift the zero-frequency component to the center of the spectrum.
disp(kf);
k = ifft(kf);
subplot(3,1,3);
plot(t, k);
grid on;
xlabel('Time, t');
ylabel('x(t)');
title('Reconstruction signal');


