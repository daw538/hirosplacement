x=linspace(0, 100, 1000);
y=11.97*x;

figure
plot(x, y)

param=1;
max=14;

prior=1/max;
likelihood=1/param;