function periods = func_pitch_estimation( s, frame_len )
    auto_corr_s = xcorr(s);
    if sum(auto_corr_s) == 0
        periods( 1:frame_len ) = 0;
    else
        periods( 1:frame_len ) = func_pitch(auto_corr_s);
    end
end