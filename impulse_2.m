clc; % clear screen
close all % close all figure windows
clear all; % clear work space
y = input('Output sequence y(n) of the system = '); % enter the output sequence
x = input('Input sequence x(n) of the system = ');% enter the input sequence
[h,r] = deconv(y,x); % deconvolute output and input to get the impulse response
disp('Impulse response of the system is = ');
disp(h);% display result
N= length(h);% find the length of h 
n = 0:1:N-1;% define time axis
stem(n,h);% plot the impulse response
xlabel('n');% label x axis
ylabel('h(n)');% label y axis
title('Impulse Response of the system'); % graph title
% verification
yv = conv(x,h)+ r;% verification of result using convolution of input and impulse to get output
disp('Verified output sequence y(n) is');
disp(yv);% display the value of output
