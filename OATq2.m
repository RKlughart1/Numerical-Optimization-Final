%% Question 2 code
clear all;
close all;
%% part 1 plotting the function f o g
tic
f = @(x,y) (x-0.5).^2 + (y-0.8).^2;
d = 2;
stepsize = 1/2^9;
t = 0:stepsize:1;
n = 10;
x = formula3(t,d,n);
for i = 1:length(t)
    if(f(x(i,1),x(i,2))<=1 && f(x(i,1),x(i,2))>=0) %Only taking values of f within the unit cube
        g(i) = f(x(i,1),x(i,2));
        X(i) = t(i);
    end
end
%Y=g';
%X = X';
%plot(X,Y,'x') % plotting f o g


%% part 2 Optimizing f with space filling method

[bbx,bby] = bb(X',g');
approximateX = Minimizebb(bbx,bby);
minValues = formula3(approximateX,d,n);
timeSpaceFilling = toc;
fprintf("Minimum found using spacefilling method at x = %f y = %f in %f seconds\n\n",minValues(1),minValues(2), timeSpaceFilling);

%% part 3 optimizing f with grid search method

tic
x = 0:(1/2^9):1;
y = x;
[X,Y] = meshgrid(x);

minx = X(1,1);
miny = Y(1,1);
f_min = f(minx,miny);

for i =1:length(X)
    for j = 1:length(Y)
        if f(X(i,j),Y(i,j)) < f_min
            minx = X(i,j);
            miny = Y(i,j);
            f_min = f(minx,miny);
            
        end
    end
end
timeGridSearch = toc;
fprintf("Minimum found using gridsearch method at x = %f y = %f in %f seconds\n\n",minx,miny, timeGridSearch);

%% Q2 part 4

if(timeSpaceFilling<=timeGridSearch)
    fprintf("\nTime using spacefilling method:%f\nTime using grid search: %f\nSpace filling is %f times faster\n",timeSpaceFilling,timeGridSearch,timeGridSearch/timeSpaceFilling)
else
    fprintf("\nTime using spacefilling method:%f\nTime using grid search: %f\nGrid Search is is %f times faster\n",timeSpaceFilling,timeGridSearch,timeSpaceFilling/timeGridSearch)
end