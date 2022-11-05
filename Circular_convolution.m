clc;
clear all;
close all;
xn = input('enter the first sequence x(n) = ');
hn = input('enter the second sequence h(n) = '); 
l1 = length(xn); % length of first sequence 
l2 = length(hn); 
N = max(l1, l2); % length of output 
xn = [xn,zeros(1,N-l1)]; % add zeros to make length of xn and hn equal 
hn = [hn,zeros(1,N-l2)];

for n = 0:N-1;
    y(n+1) = 0;
    for k = 0:N-1;
        i = mod((n-k), N);
        if (i<0);
            i = i + N;
        end
        y(n+1) = y(n+1) + xn(k+1)* hn(i+1);
    end
end
disp('Circular Convolution = '); 
disp(y); % display output 

subplot(2,2,1); %Graphical display of first input sequence 
stem(xn); 
xlabel('n'); 
ylabel('x(n)'); 
title('Plot of x1(n)'); 

subplot(2,2,2); %Graphical display of second input sequence 
stem(hn); 
xlabel('n');
ylabel('(h(n)'); 
title('Plot of x2(n)'); 

subplot(2,1,2); %Graphical display of output sequence stem(y); 
stem(y);
xlabel('n'); 
ylabel('y(n)'); 
title('Circular Convolution Output');
        