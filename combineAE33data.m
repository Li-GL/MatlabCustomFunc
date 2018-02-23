function combineAE33Data

    %Setting
    StartDate = '2016-01-01';
    StopDate = '2016-01-20';
    FileNameStartStr = 'AE33_AE33-S03-00286_';
    
    %Generate File Name
    StartDateNum = datenum(StartDate,'yyyy-mm-dd');
    StopDateNum = datenum(StopDate,'yyyy-mm-dd');
    curDate = StartDateNum;
    %fileNameArr = {[FileNameStartStr datestr(curDate,'yyyymmdd') '.dat']};
    fileNameArr = {};
    while curDate<StopDateNum & strcmp(datestr(curDate,'yyyymmdd'),datestr(StopDateNum,'yyyymmdd'))~=1
        fileNameArr(size(fileNameArr,2)+1) = {[FileNameStartStr datestr(curDate,'yyyymmdd') '.dat']};
        curDate = addtodate(curDate, 1, 'day');
    end
    
    %Combine
    saveFileName = ['CombinedFrom' datestr(StartDateNum,'yyyymmdd') 'to' datestr(StopDate,'yyyymmdd') '.txt'];
    AllFileName = dir();
    AllFileName = AllFileName(3:end);
    for i=1:size(fileNameArr,2)
        disp(['Processing ' char(fileNameArr(i))]);
        for j=1:size(AllFileName,1)
            try
                if strcmp(fileNameArr(i),AllFileName(j).name) == 1
                    
                    %Read Data
                    fid = fopen(char(fileNameArr(i)),'r');
                    textscan(fid,'%s',8,'delimiter','\n','collectoutput',1);
                    readText=textscan(fid,'%s','delimiter','\n','collectoutput',0);
                    fclose(fid);
                    
                    %Write Data
                    fid = fopen(saveFileName,'a');
                    for k=1:size(readText{1},1)
                        fprintf(fid,'%s\r\n',char(readText{1}{k}));
                    end
                    fclose(fid);
                    break;
                end
            catch
                disp(['error on finding ' fileNameArr(i) ' when try ' AllFileName(j).name]);
            end
        end
    end
    
    disp('Finish');
    
end