clc
clear;
close all;
Path = 'clean_seg\';                   % �������ݴ�ŵ��ļ���·��
File = dir(fullfile(Path,'*.wav'));  % ��ʾ�ļ��������з��Ϻ�׺��Ϊ.txt�ļ���������Ϣ
FileNames = {File.name}';            % ��ȡ���Ϻ�׺��  Ϊ.txt�������ļ����ļ�����ת��Ϊn��1��
Length_Names = size(FileNames,1);    % ��ȡ����ȡ�����ļ��ĸ���
SNR=10;
outpath1='babble\10dB\optical\';  
outpath2='babble\10dB\sound\';
I_noise=audioread('babble.wav');
name=1;
FS=200000;
save_fs=200000;
for k = 1 :2000
    % ����·�����ļ����õ��������ļ�·��
    K_Trace = strcat(Path, FileNames(k));
    [I,fs]=audioread(K_Trace{1});
    %I_noise=awgn(I,0);
    noisy=add_noise_model(I,I_noise,SNR);
    [I_optical,I_sound]=recon(noisy,fs);

    path1=[outpath1,sprintf('%02d',name), '.wav'];
    path2=[outpath2,sprintf('%02d',name), '.wav'];
   audiowrite(path1,I_optical./max(I_optical),save_fs);

   audiowrite(path2,I_sound./max(I_sound),save_fs);

    name=name+1;
    
end


