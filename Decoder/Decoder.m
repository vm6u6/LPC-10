close all; clear; clc;

%% Read the file
[x,Fs] = audioread("test.wav");
load('coeff.mat')
load('gain.mat')
load('voiced.mat')
load('pitch_periods.mat')

% Perameters
p = 10;                       
frame_size = 0.022;
frame_len = frame_size * Fs;
h = [1 -0.9375]; 

%% Start Decoding...

for i = 1:frame_len:( length(voiced) )
    if( voiced(i) == 0 )                                                                    % unvoiced
        white_noise = randn(1,frame_len);                                                   % Adding white noise
        recon(i:i+frame_len-1) = filter(1, [1 coeff((i+1):(i+1+p-1))], white_noise*gain(i));
    
    elseif ( voiced(i) == 1 )                                                               % voiced
        trans = func_transform( periods, i, frame_len );
        recon(i:i+frame_len-1) = filter(1, [1 coeff((i+1):(i+1+p-1))], trans*gain(i));
    end
end

%% De-emphasis
dec_aud = filter( abs(h), 1, recon );
sentc = dec_aud/(max(abs(dec_aud)));
audiowrite('reconstruction.wav',sentc, 8000)
