function [y_noise]=add_noise_model(clean_signal,noise_signal,SNR)
%clean_signal�Ǹɾ������ź�
%noise_signal�������ź�
%SNR�������

nx=size(clean_signal,1);  %�����źų���
noise=noise_signal(1:nx);
noise=noise-mean(noise);    %�����ź�ȡ��ֵ
signal_power=1/nx*sum(clean_signal.*clean_signal); %�����ź�ƽ������
noise_variance=signal_power/(10^(SNR/10));    %������ȼ�����������ķ���
noise=sqrt(noise_variance)/std(noise)*noise;   %�����źű�׼��Ϊstd(noise)��������ı�׼��Ϊsqrt(noise_variance)�������Ҫ�����������漴����
y_noise=clean_signal+noise;   %�ɾ������źŵ��������ź�