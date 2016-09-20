function [dt_AE42_num,BC_880, BC_370, BC_7ch]=readAE42(inp_ae42_csv)
% The input and output format is:  
%[date_num,BC_880nm, BC_370nm, BC42_7 chanels]=readAE42('file name')
% Note that the unit is ng/m3,  if BC data <= 0, set it to NaN

ae42_input=inp_ae42_csv;
fid_ae42=fopen(ae42_input);
c1=0;
c2=0;
while ~ feof(fid_ae42)
    c1=c1+1;
      tline_ae42=fgetl(fid_ae42);
      tline_ae42_imprv=strrep(tline_ae42,'"',' ');
      tline_ae42_imprv2=strrep(tline_ae42_imprv,',',' ');

    

    [t1 r1]=strtok(tline_ae42_imprv2);
    [t2 r2]=strtok(r1);
    [t3 r3]=strtok(r2);
        if (isempty(str2num(r3))==0)

   c2=c2+1;
         r_num=str2num(r3); 
         [r c]=size(r_num);
     dt_ae42_numi(c2,1)=datenum(strcat(t2,t3,':00'),'dd-mmm-yyHH:MM:SS');
    BC42_ch1_ch7 = r_num(1,1:7);
    
    BC_7ch(c2,:)=BC42_ch1_ch7; 

   
        else 
            continue
   
    end
end

BC_7ch(BC_7ch<=0)=NaN;
BC_880=BC_7ch(:,6); BC_370=BC_7ch(:,1);
dt_AE42_num=dt_ae42_numi;




