function [outDatetime outputData] = averageTime(inputDateime, inputData,timeInterval, startTime )
%[dateTime outputData] = averagetime(timeInterval, startTime, inputData)
%Note that inputDateime should be date or time Number. 
% Unit of timeInterval is min
% startTime is date Number, usually equals to inputDatetime(1)
% do averaging every timeInterval time
% 14:30?????????14:00-14:30 


timeinterval_num = timeInterval/60/24;

%?????????????end

time=startTime;

%?????index??????????nanmean
i=1;
while time <= inputDateime(end)
    
    ind = find(inputDateime>=(startTime+(i-1)*timeinterval_num) & inputDateime<=(startTime+i*timeinterval_num));
    outDatetime(i) = startTime+i*timeinterval_num;
    outputData(i) = nanmean(inputData(ind));
    
    time = startTime+i*timeinterval_num;
    
    
    i=i+1;
    
end

outDatetime = outDatetime';
outputData = outputData';


