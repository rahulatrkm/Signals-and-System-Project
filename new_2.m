% Record your voice for 60 seconds.
recObj = audiorecorder(1000,8,1);
disp('Start speaking.')
recordblocking(recObj, 60);
disp('End of Recording.');
fs = 1000;
fs1 = 50;
% Store data in double-precision array.
y = getaudiodata(recObj);

% Plot the waveform.
figure;
plot(y);
xlabel('Samples (n)');
ylabel('Amplitude ');
title('Plot of Speech signal');
len = length(y);
% fs1 because we have to sample for 20ms
temp = round(len*fs1/fs);
temp1 = len*fs1/fs;
% preventing temp to go out of limit
if temp>temp1
    temp = temp-1;
end
% Intializing the signal
y2 = zeros(1,temp);
% Taking the samples at the interval of 20ms
for k = 1:temp
    y2(k) = y(((k-1)*fs/fs1)+1);
end
% Number of samples in 1 sec = fs2;
y3 = vec2mat(y2(:),fs1);
Y = zeros(size(y3));
for k = 1:size(y3,1)
    Y(k,:) = fft(y3(k,:),size(y3,2));
end
Y  = abs(Y);
Y1 = Y';
figure;
imagesc(Y1);
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
title('Image plot of speech signal Transform');
caxis([min(Y(:)) max(Y(:))]);
colorbar;
figure;
surf(Y1);
caxis([min(Y(:)) max(Y(:))]);
colorbar;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
zlabel('amplitude');
title('Surface plot of speech signal Transform');
