function zcr = func_zcr(segment)
    zcr = 0;
    for i = 1:length(segment)-1  
        if segment(i+1) * segment(i) < 0
            zcr = zcr + 1;  
        end
    end
%     zcr = sum(segment(1 : end - 1) .* segment(2:end) <= 0);
%     zcr = sum(abs(diff(segment > 0))); 
end
