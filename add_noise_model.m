function [y_noise]=add_noise_model(clean_signal,noise_signal,SNR)
%clean_signal是干净语音信号
%noise_signal是噪声信号
%SNR是信噪比

nx=size(clean_signal,1);  %语音信号长度
noise=noise_signal(1:nx);
noise=noise-mean(noise);    %噪声信号取均值
signal_power=1/nx*sum(clean_signal.*clean_signal); %语音信号平均功率
noise_variance=signal_power/(10^(SNR/10));    %按信噪比计算加入噪声的方差
noise=sqrt(noise_variance)/std(noise)*noise;   %噪声信号标准差为std(noise)，随机数的标准差为sqrt(noise_variance)，求出需要加入噪声的随即序列
y_noise=clean_signal+noise;   %干净语音信号叠加噪声信号