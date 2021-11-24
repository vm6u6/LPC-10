function period = func_pitch( auto_corr_y )
    
%     [peaks, places] = findpeaks(auto_corr_y);
%     [~, max_peak_place] = max(peaks);
%     max_peak_place = places(max_peak_place); % First max place
%     
%     [~, max_peak2_place] = max(peaks(ceil(length(peaks)/2)+1:end)); % Finding the secon peak
%     places = places(ceil(length(peaks)/2)+1:end);
%     max_peak2_place = places(max_peak2_place); % Second max place
%     period = (max_peak2_place-max_peak_place);

    [ ~, locs ] = findpeaks( auto_corr_y );
    [ ~, pk1_idx ] = min( 8000./diff(locs) );
    period = locs( pk1_idx+1 ) - locs( pk1_idx );
    period = 1/mean(period);
end
