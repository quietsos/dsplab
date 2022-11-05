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
disp(c)
disp(h)
y=c*h;
disp('Correlation of the sequences')
disp(y');
stem(y);
energy=sum(y.^2);
disp('Energies ');
disp(energy);

center_index=ceil(length(y)/2);
%access the center value
y_0=y(center_index);
disp('Center index  ');
disp(center_index);
disp('center enrgy   ');
disp(y_0);

%check the energy of center index

if y_0==energy
    disp('y(o) gives energy proved');
else
    disp('y(o) dont gives energy proved');
end
y_right=y(center_index:1:length(y));
disp('y_right is ...');
disp(y_right);
y_left =y(center_index:-1:1);
disp('y_left is ...');
disp(y_left);
if y_right==y_left
    disp('y is even');
else
    disp('y is not even');
end