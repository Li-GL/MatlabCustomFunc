function [outDatetime, outputData] = averageTime(Datetime_num, inputData,startTime_str, endTime_str, timeInterval_min, removeTime_min)
%[outDatetime, outputData] = averageTime(Datetime_num, inputData,startTime_str, endTime_str, timeInterval_min, removeTime_min)
% averageTime(dateNum, inputData,dateNum(1), 15(min), 2(min))
%Note that inputDateime should be dateNumber. 
% startTime is when you start the experiment, it's date Number, usually equals to inputDatetime(1)
% timeInterval is the interval you want to do averaging, removeTime is time
% you want to remove in both front and end of your dataset
%Unit of timeInterval and removeTime is min
% do averaging every timeInterval time
% 14:30�������14:00-14:30
%%Ʃ����ƽ��14:00 - 14:15�����ݣ�����14:00-14:02��14:13-14:15�����ݲ�����ƽ����������Ӧ��Ϊ
%[outTime, outBC33] = averageTime(dt_ae33_num, BC33_880,'2016-10-30 07:20', '2016-10-30 20:00',10,1)

timeinterval_num = timeInterval_min/60/24;
removeTime_min = removeTime_min/60/24;


time=datenum(startTime_str);
startTime_num = datenum(startTime_str);

%��index������NAN��ƽ��nanmean
i=1;
while time <= datenum(endTime_str)
    
    
    
    ind = find(Datetime_num>= time + removeTime_min & Datetime_num<(time+timeinterval_num-removeTime_min));
    outDatetime(i) = startTime_num+i*timeinterval_num;
    outputData(i) = nanmean(inputData(ind));
    
    time = startTime_num+i*timeinterval_num;
    
    
    i=i+1;
    
end

outDatetime = outDatetime';
outputData = outputData';


