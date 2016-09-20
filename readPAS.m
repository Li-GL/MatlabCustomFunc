function [dt_PAS_num, PAHs]=readPAS(InpTxt)
%The input and output format is:  
% [dt_PAS_num, PAHs]=readPAS('file name')
% Note that the unit is ng/m3,  if PAHs<=0, set it to NaN

filename=InpTxt;
fid=fopen(filename);

data=textscan(fid,repmat('%s ',1,4),'delimiter','\t','Headerlines', 1);
fclose(fid)

dt_PAS_num=datenum(data{1},'yyyy-mm-ddHH:MM:SS.FFF');
c=0;
for i=2:1:4
   c=c+1;
   p=data{i};
   for j=1:1:length(p);
   P_L_U(j,c)=str2num(p{j});
   end
    
end

 PAHs=P_L_U(:,1);
 PAHs(PAHs<=0)=NaN;