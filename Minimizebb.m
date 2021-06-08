%helper to find minimum of bb

function minVal = Minimizebb(bbx,bby)

min = bby(1);
minIndex = 0;

for i = 2:length(bby)
    if(min>bby(i))
        min=bby(i);
        minIndex=i;
    end
end
minVal = bbx(minIndex);
end