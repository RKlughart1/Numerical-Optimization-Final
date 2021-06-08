%code to generate graph for question 2 bivariate function

f = @(x,y) (x-0.5).^2 + (y-0.8).^2;
X = 0:0.05:1;
Y = X;

[X,Y] = meshgrid(X,Y);
F = f(X,Y);
surf(X,Y,F)