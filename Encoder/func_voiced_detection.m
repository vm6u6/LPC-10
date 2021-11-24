function voiced = func_voiced_detection( s, frame_len )
    energy = sum(abs(s).^2);
    if energy > 5
        voiced(1:frame_len) = 1;
    else
        voiced(1:frame_len) = 0;
    end
    % Determine based on zero crossing rate
    tmp = func_zcr( s );
    if tmp < 45 && tmp > 0
        voiced(1:frame_len) = 1;
    else
        voiced(1:frame_len) = 0;
    end
end