clc;
clear all;
close all;
x1 = input('Enter the first sequence x1(n) = ');
x2 = input('Enter the first sequence x2(n) = ');
n1 = -3:3;
n2 = -2:2;
y_begin = n1(1) + n2(1);
disp(y_begin);
y_end = n1(length(x1)) + n2(length(x2));
ny = [y_begin : y_end];
%y = conv(x1, x2);
N = length(n1)+length(n2)-1;

x11 = [x1,zeros(1,length(x2)-1)]; % add zeros to make length of xn and hn equal 
x22 = [x2,zeros(1,length(x1)-1)];
y = zeros(1, N);
for n = 1:N
    for k = 1:n
        y(n) = y(n) + x11(k)* x22(n-k+1);
    end
end
disp('Linear convolution of x1 and x2 is = ');
disp(y);

subplot(2,2,1);
stem(n1, x1);
xlabel('n');
ylabel('x1(n)');
title('plot of x1');

subplot(2,2,2);
stem(n2, x2);
xlabel('n');
ylabel('x2(n)');
title('plot of x2');

subplot(2,1,2);
stem(ny, y);
xlabel('n');
ylabel('y(n)');
title('Convolution output');