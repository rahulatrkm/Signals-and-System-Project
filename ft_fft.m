clc; clear all; close all;
[y, fs]=audioread('C:\Users\rahul\Desktop\05 Delicate.mp3');
len = length(y);
% 50 because we have to sample for 0.02ms
temp = round(len*50/fs);
temp1 = len*50/fs;
% preventing temp to go out of limit
if temp>temp1
    temp = temp-1;
end
temp1 = round(temp/60);
% Intializing the signal
y1 = zeros(60,temp1);
% Taking the samples at the interval of 0.02ms
for k = 1:temp
    y1(k) = y(((k-1)*fs/50)+1);
end

Y = fft(y1,temp);
stem(1:length(Y),abs(Y));
temp2 = round(temp*fs/length(Y));
c = zeros(temp,temp2);
for k = 1:temp
    c(k,round(k*fs/temp)) = y1(k);
end
figure;
imagesc(c)