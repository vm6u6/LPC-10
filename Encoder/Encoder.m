clc; clear; close all;

%% Read the file
[x,Fs] = audioread("test.wav");

% Normalize the speech
maximum = max(abs(x));
x = x/maximum;

% Perameters
p = 10;                       
frame_size = 0.022;
frame_len = frame_size * Fs;
n = fix(numel(x)/frame_len);

%%  Pre-emphasis
h = [1 -0.9375]; 
x = filter(h,1,x);

%% Start Encoding...
tmp = zeros( 1, frame_len );
gain = zeros( 1, n*frame_len );
for i = 1:n
    s = x( (i-1)*frame_len+1:i*frame_len);
    % Voicing detector
    voiced( (i-1)*frame_len+1:i*frame_len ) = func_voiced_detection( s, frame_len );
    % LP analysis and Prediction-error filter and Power Computation(Gain)
    [a, gain((i-1)*frame_len+1)] = lpc( s, p );
    est_s = filter([0 -a(2:end)],1,s);  
    err = s - est_s;
    coeff( (i-1)*frame_len+1:(i-1)*frame_len+length(a) ) = a;
    % Pitch period
    periods( (i-1)*frame_len+1:i*frame_len ) = func_pitch_estimation(s, frame_len);
end

%% Save paramet

save coeff coeff
save gain gain
save voiced voiced
save pitch_periods periods




