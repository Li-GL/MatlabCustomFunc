function a=movingaverage(input, lag)
% a=movingaverage(input, lag);
%use nanmean, i.e. nanmean([nan 4])= 4;
% no need to delete the NaN.
b = lag;
m=1;
while b<=length(input);
     a (b, 1) = nanmean(input (m: m+lag-1, 1));
     b=b+1;
     m = m+1;
end
a(1:lag-1, 1) = nan;