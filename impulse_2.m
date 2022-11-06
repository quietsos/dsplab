N=45;
num=[0.9 -0.45 0.35 0.002];
den=[1.0 0.71 -0.46 -0.62];
n=0:N-1;
x=(n==0);
y=filter(num,den,x);
stem(n,y);