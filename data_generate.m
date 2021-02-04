clc
clear;
close all;
Path = 'clean_seg\';                   % 设置数据存放的文件夹路径
File = dir(fullfile(Path,'*.wav'));  % 显示文件夹下所有符合后缀名为.txt文件的完整信息
FileNames = {File.name}';            % 提取符合后缀名为.txt的所有文件的文件名，转换为n行1列
Length_Names = size(FileNames,1);    % 获取所提取数据文件的个数
outpath1='clean_200K\optical\';  
outpath2='clean_200K\sound\';
name=1;
FS=200000;
save_fs=200000;
for k = 1 :Length_Names
    % 连接路径和文件名得到完整的文件路径
    K_Trace = strcat(Path, FileNames(k));
    [I,fs]=audioread(K_Trace{1});

    [I_optical,I_sound]=recon(I,fs);

    path1=[outpath1,sprintf('%02d',name), '.wav'];
    path2=[outpath2,sprintf('%02d',name), '.wav'];
   audiowrite(path1,I_optical./max(I_optical),save_fs);

   audiowrite(path2,I_sound./max(I_sound),save_fs);

    name=name+1;
    
end

