function trans = func_transform( periods, i, frame_len )
    trans = zeros( 1, frame_len );
    for j = 1:frame_len
        if( j/periods(i) == floor( j/periods(i) ) )
            trans(j) = 1;
        else 
            trans(j) = 0;
        end
    end  
end