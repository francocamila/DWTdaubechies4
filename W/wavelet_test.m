clear all ; close all; clc;
%program to apply the DWT daubechies 4 to a sinusoidal signal.
f=60; %frequency of the sine wave;
NsC= 256; %number of samples per cycle;
NoC=1; %number of cycles;
Fs = f * NsC; %sample rate;
Ts=1/Fs; 
t=0:Ts:(NoC/f)-Ts; %creating the time axis;
x=sin(2*pi*f*t)'; %creating the signal;
figure;
stem(x); %plotting the samples; 
xlabel('n')
ylabel('{x[n]}')
title('Sinal Original.')
grid on;
dwtmode('per'); warning off all; %changing to periodized extension;
levels = log2(NsC*NoC); %calculating the decomposition level;
[C,L] = wavedec(x, levels ,'db4'); %performing the wavelet transform;  
figure;
n = 0 : length(C) - 1; %starting from zero; 
stem(n, C, '.');
xlabel('n')
ylabel('{x[n]}')
title('Transformada de wavelet Daubechies-4 do sinal original')
grid on;

X = waverec(C,L,'db4'); %performing the reconstruction of the signal;
figure;
stem(X);
xlabel('n')
ylabel('{x[n]}')
title('Sinal reconstruido')
grid on;

err = x - X; % calculating the error;
figure;
plot(err);
title('Erro de reconstrucao')
grid on;

