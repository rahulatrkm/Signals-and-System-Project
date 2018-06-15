clc; clear all; close all;
[y, fs]=audioread('C:\Users\rahul\Desktop\05 Delicate.mp3');
% changing the sampling frequency
fs1= fs;
audiowrite('sampled.mp4',y,fs1);
% Read the data back into MATLAB using audioread.
[y1, fs2] = audioread('sampled.mp4');

% 50 because we have to sample for 0.02ms
temp = round(len*50/fs);
temp1 = len*50/fs;  
% preventing temp to go out of limit
if temp>temp1
    temp = temp-1;
end
temp1 = round(temp/60);
% Intializing the signal
y2 = zeros(60,temp1);
% Taking the samples at the interval of 0.02ms
for k = 1:temp
    y2(k) = y(((k-1)*fs/50)+1);
end

% Number of samples in 1 sec = fs2; 
y2 = vec2mat(y1(:),fs2);
Y = zeros(size(y2));
for k = 1:size(y2,1)
    Y(k,:) = fft(y2(k,:),size(y2,2));
end
Y  = abs(Y);
Y1 = Y';
figure;
surf(z);
figure;
imagesc(Y1);
caxis([min(Y(:)) max(Y(:))]);
colorbar;