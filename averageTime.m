function [outDatetime outputData] = averageTime(inputDatetime, inputData,startTime, timeInterval, removeTime)
%[outDatetime outputData] = averageTime(inputDateime, inputData,timeInterval, startTime )
%Note that inputDateime should be dateNumber. 
% startTime is when you start the experiment, it's date Number, usually equals to inputDatetime(1)
% timeInterval is the interval you want to do averaging, removeTime is time
% you want to remove in both front and end of your dataset
%Unit of timeInterval and removeTime is min
% do averaging every timeInterval time
% 14:30代表的是14:00-14:30

%%譬如想平均14:00 - 14:15的数据，但是14:00-14:02和14:13-14:15的数据不参与平均，则输入应该为
%averageTime(inputDatetime, inputData,14:00, 15, 2)
%注意这里假设开始时间inputDatetime(1) = 14:00


timeinterval_num = timeInterval/60/24;
removeTime = removeTime/60/24;


time=startTime;

%找index，消除NAN求平均nanmean
i=1;
while time <= inputDatetime(end)
    
    
    
    ind = find(inputDatetime>= time + removeTime & inputDatetime<=(time+i*timeinterval_num-removeTime));
    outDatetime(i) = startTime+i*timeinterval_num;
    outputData(i) = nanmean(inputData(ind));
    
    time = startTime+i*timeinterval_num;
    
    
    i=i+1;
    
end

outDatetime = outDatetime';
outputData = outputData';


