clc; 
clear all;
close all;

y=input('Enter 1st the coofficient:');
x= input('Enter 2nd the coofficient:');
N=input('Enter the length:');

xi=[1,zeros(1,N-1)];
h=filter(x,y,xi);
disp('impulse response')
disp(x)
n=0:1:N-1;
stem(n,h);