function rx_data = lempelziv_decoder(rx_bitstream, codeword_len)

% Input: rx_bitstream is a string and codeword_len is an integer
% Output: rx_data is of String type

% This line of code is for the program to run. Please remove after you finish implmenting the module.
    
    rx_bitstream = convertStringsToChars(rx_bitstream);
    dict = struct([]);
    for step = 1 : length(rx_bitstream)/codeword_len
        chop = rx_bitstream((step-1)*codeword_len + 1:step*codeword_len);
        dict(step).suf = chop(codeword_len);
        dict(step).parent = bin2dec(chop(1:(codeword_len-1)));
    end
    
    rx_data = "";
    for step = 1 : length(rx_bitstream)/codeword_len
        if dict(step).parent == 0
            dict(step).patt = ['', dict(step).suf];
        else
            dict(step).patt = [dict(dict(step).parent).patt, dict(step).suf];
        end
        rx_data = strcat(rx_data, dict(step).patt);
    end
end