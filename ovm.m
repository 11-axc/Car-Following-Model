%function ovm()
clc;
clear;
N=10;       %10����
L=20;       %ϵͳ��С
dt=0.05;    %ʱ�侫��
c=2.0;      %��ȫ����
t=500;      %����ʱ��
b=L/N;      %�ܶ�
a=2.5;      %����ϵ��
s_time=0;   %����ʱ��
x=zeros(1,N);   %ÿ��������λ��
v=zeros(1,N);   %ÿ���������ٶ�
tx=zeros(1,N);  %rk��������λ������
tv=zeros(1,N);  %rk���������ٶ�����
fx=zeros(1,N);  %fx,�����ĳ�ʼֵ
fv=zeros(1,N);  %fv�������ĳ�ʼֵ
eps=0.1;    %��ʼ���0.1
jx=zeros(t/dt,N);   %��¼���г���ÿһ����ʱ�̵�λ����Ϣ
jv=zeros(t/dt,N);   %��¼���г���ÿһ����ʱ�̵��ٶ���Ϣ

%�Գ�ʼ���ȳ���ʩ��С�Ŷ�
for i=1:N
    x(i)=b*(i-1)+eps*rand(1,1);     %��ʼλ�ü��Ŷ�
%    x(i)=b*(i-1);                   %��ʼλ�ò����Ŷ���
    v(i)=tanh(b-c)+tanh(c);         %����������ٶ�
end

%ÿ������ʱ�̵����г�����λ�ã��ٶ�
for j=1:t/dt
   %calcf  ��x��v�ĵ���fx,fv
   %integrate(x,v)  
   [x,~]=integrate_RungeKutta(x,v,fx,fv,N,L,a,c,dt,tx,tv);    %������������������������ֵ��
   [~,v]=integrate_RungeKutta(x,v,fx,fv,N,L,a,c,dt,tx,tv);    %��Ϊֻ�е�������û��ԭ�������޷�ֱ���������
   jx(j,:)=x;
   jv(j,:)=v;
   
   for k=1:N
     if x(k)>L
         x(k)=x(k)-L;    %ѭ�����еı߽�����������ϵͳ���Ⱥ�ó�λ�ô�0��ʼ
     end
   end 
end



%end