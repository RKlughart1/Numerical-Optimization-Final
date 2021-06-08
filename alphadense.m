%formula 3 of the paper that was implemented from the paper, but then
%modifications to this were made to test for accuracy of the space-filling
%method

function values = alphadense(t,d,n)
 
values = zeros(length(t),d);
values(:,1) = t;
 
for i = 2:d
    values(:,i) = 0.5*(1-sin(n^(i-1)*t*pi)); 
    %values(:,i) = 0.5*(1-cos(n^(i-1)*t*pi));
    %values(:,i) = 0.5*(cos(n^(i-1)*t*pi));
    %values(:,i) = (cos(n^(i-1)*t*pi));
    
end
end