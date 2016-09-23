function [outDatetime outputData] = averageTime(inputDatetime, inputData,startTime, timeInterval, removeTime)
%[outDatetime outputData] = averageTime(inputDateime, inputData,timeInterval, startTime )
%Note that inputDateime should be dateNumber. 
% startTime is when you start the experiment, it's date Number, usually equals to inputDatetime(1)
% timeInterval is the interval you want to do averaging, removeTime is time
% you want to remove in both front and end of your dataset
%Unit of timeInterval and removeTime is min
% do averaging every timeInterval time
% 14:30�������14:00-14:30

%%Ʃ����ƽ��14:00 - 14:15�����ݣ�����14:00-14:02��14:13-14:15�����ݲ�����ƽ����������Ӧ��Ϊ
%averageTime(inputDatetime, inputData,14:00, 15, 2)
%ע��������迪ʼʱ��inputDatetime(1) = 14:00


timeinterval_num = timeInterval/60/24;
removeTime = removeTime/60/24;


time=startTime;

%��index������NAN��ƽ��nanmean
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


