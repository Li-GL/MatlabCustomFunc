function [dt_ae33_num, BC33_880, BC33_all] = readAE33 (Input_filename)
% Reading AE33 data  %% flash disk version
% [dt_ae33_num BC33_880 BC33_370] = readAE33 (Input_filename);
% Note that the unit is ng/m^3, if BC33_880<=0, set it to NaN

fid = fopen(Input_filename);
% Header = textscan(fid, '%s', 73, 'delimiter', '\t');
ae33_Data = textscan(fid, ['%s%s',repmat('%s',1,60), '%s%[^\n] '], 'delimiter', ' ', 'headerlines', 6 );
fclose(fid);
dt_ae33_num=datenum(strcat(ae33_Data{:,1}, '/', ae33_Data {:,2} ),'yyyy/mm/dd/HH:MM:SS');
UV = str2num(char(ae33_Data{41}));
Blue = str2num(char(ae33_Data{44}));
Green = str2num(char(ae33_Data{47}));
Yellow = str2num(char(ae33_Data{50}));
Red = str2num(char(ae33_Data{53}));
IR1 = str2num(char(ae33_Data{56}));
IR2 = str2num(char(ae33_Data{59}));
BC33_880=IR1;
BC33_880(BC33_880<=0)=NaN;
BC33_370 = UV;
BC33_370(BC33_370<=0) = NaN;

% remove outlier


BC33_all = [UV Blue Green Yellow Red IR1 IR2];
BC33_all(BC33_all<=0) = NaN;


end
