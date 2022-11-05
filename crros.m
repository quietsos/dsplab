clc;
clear all;
close all;

x=input('Enter the first Sequence : ');
h=input('Enter the second Sequence : ');

n=length(x);
m=length(h);
k=n+m-1;
x=[x zeros(1,k-n)]';
h=wrev(h);
h=[h zeros(1,k-m)]';
for i=1:k
c(:,i)=circshift(x,i-1);
end
y=c*h;
disp('Correlation of the sequences')
disp(y');
stem(y);