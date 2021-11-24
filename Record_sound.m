clc
clear
close all

recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj, 3);
disp('End of Recording.')
play(recObj);
y = getaudiodata(recObj);
audiowrite('test.wav', y, 8000);