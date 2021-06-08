%formula 3 from the paper

function values = formula3(t,d,n)
 
values = zeros(length(t),d);
values(:,1) = t;
 
for i = 2:d
    values(:,i) = 0.5*(1-cos(n^(i-1)*t*pi)); 
end
end