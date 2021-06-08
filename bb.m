function [bbx,bby] = bb(X,Y)
%compute the lower convex envelope of a set of points in the plane using the Beneath-Beyond algorithm (linear time)
if any(size(Y)~=size(X))
    error("inconsistent input size in pl_bb");
end
if size(X,2)>1 %convert input to column vector
    X=X';Y=Y';
end
if size(X,2)>1
    error("pl_bb only works for vectors, not matrices");
end
n = size(X,1);
if n==1, bbx=X;bby=Y;return;end
CX=nan * ones(n,1); CY=CX;
CX(1:2)=[X(1);X(2)];CY(1:2)=[Y(1);Y(2)];
v=2;

%We look at each point only once, this gives the linear-time algorithm.
for i=3:n
    y=((CY(v)-CY(v-1))/(CX(v)-CX(v-1)))*(X(i)-CX(v))+CY(v);
    while (v>2 && Y(i)<=y) % Erase points which are not vertices of the convex envelope
        v=v-1;
        y=((CY(v)-CY(v-1))/(CX(v)-CX(v-1)))*(X(i)-CX(v))+CY(v);
    end
    if v>2
        CX(v+1)=X(i);
        CY(v+1)=Y(i);
        v=v+1;
    else
        if Y(i)>y %Trivial convex envelope
            CX(3)=X(i);CY(3)=Y(i);v=3;
        else
            CX(2)=X(i);CY(2)=Y(i);
        end
    end
end
bbx=CX(1:v);bby=CY(1:v);
end