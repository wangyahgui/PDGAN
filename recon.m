function [I_optical,I_sound]=recon(I_input,fs)
num=floor(length(I_input)/fs);
FS=2e5;%����Ƶ��200000
onti=(1/FS:1/FS:num)';%��ֵ�������ʱ�����У���λΪs
I_sound=resample(I_input,FS,fs);
I_sound=I_sound(1:num*FS);
wl=1550;%���Ⲩ������λ����
fm = 50e3;%����Ƶ��
opdr =100;%�������ת��Ϊ��̲����ӣ���̲�Ϊ����
ss =opdr*I_sound;%���ת��Ϊ��̣���λ����//�������������
%figure(1),subplot(2,2,1),plot(ss);title('�񶯷�ֵ(nm)');
pt=2*pi*(fm)*onti;%�ο���
ph_d = 4*pi*ss/wl;%�����������λ�仯
ps=pt+ph_d;%������
I_optical= cos(ps)+cos(pt);%���ź�ת��Ϊ���źţ����ƺ�������ź�



