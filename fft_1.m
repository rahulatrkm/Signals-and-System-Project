clc; clear all; close all;

mm=[];
[y, fs]=audioread('record-4-14-2018_7-45-41.mp3');
[y1, fs1]=audioread('C:\Users\rahul\Desktop\05 Delicate.mp3');
Ts=1/fs;
N = length(y);
t = (1:N)*Ts;
for k=1:N
    for n=1:N
        y1(n)= y(n).*exp(-1i*2*pi*(n-1)*(k-1)/N);
    end
    mm = [mm sum(y1)];
end
f=fs.*(0:N-1)/N;
figure;
plot(f,mm);
title('Frequency spectrum for given signal without FFT biltin function');
xlabel('Frequency(Hz)');
ylabel('Amplitude');


