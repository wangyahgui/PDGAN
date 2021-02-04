function [I_optical,I_sound]=recon(I_input,fs)
num=floor(length(I_input)/fs);
FS=2e5;%采样频率200000
onti=(1/FS:1/FS:num)';%插值后的数据时间序列，单位为s
I_sound=resample(I_input,FS,fs);
I_sound=I_sound(1:num*FS);
wl=1550;%激光波长，单位纳米
fm = 50e3;%调制频率
opdr =100;%声音振幅转化为光程差因子，光程差为纳米
ss =opdr*I_sound;%振幅转化为光程，单位纳米//声音引起的振动量
%figure(1),subplot(2,2,1),plot(ss);title('振动幅值(nm)');
pt=2*pi*(fm)*onti;%参考光
ph_d = 4*pi*ss/wl;%声音引起的相位变化
ps=pt+ph_d;%测量光
I_optical= cos(ps)+cos(pt);%光信号转化为电信号，调制后的声音信号



