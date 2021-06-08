%full space-filling method from the paper

function xStar = fullMethod(f,epsilon,d,n)
step = 1/2^9;
t = 0:step:1;
x = alphadense(t,d,n);
g = zeros(length(t),1);
for i = 1:length(t)
    g(i) = f(x(i,:));
end
X=t';Y=g;
[bbx,bby] = bb(X,Y);
[~,index] = min(bby);
xStar = alphadense(bbx(index),d,n);
end