function [d_avg, data_avg] = average (input_dt, input_data, points);
% This is a function of averaging data every  n points, The 
%[d_avg, data_avg] = average (input_dt, input_data, points)
n = points;
for m=1:length(input_data);
    AvgBC=input_data((m-1)*n+1:m*n,1);
    data_avg(m,1)=mean(AvgBC(~isnan(AvgBC)));
    d_avg(m,1)=input_dt((m-1)*n+1,1);
      if (m+1)*n>length(input_data);
      break
       end
end