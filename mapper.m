function symbol_stream = mapper(tx_bitstream, modulation)
    
% Bit-to-symbol mapping for QPSK
% 00 --- 1/sqrt(2) + j * 1/sqrt(2)
% 01 --- -1/sqrt(2) + j * 1/sqrt(2)
% 11 --- -1/sqrt(2) - j * 1/sqrt(2)
% 10 --- 1/sqrt(2) - j * 1/sqrt(2)

% You only need to implement "QPSK".

% Input: tx_bitstream is a string, modulation is "QPSK"
% Output: symbol_stream is a vector of symbols

% This line of code is for the program to run. Please remove after you finish implmenting the module.

    tx_bitstream = convertStringsToChars(tx_bitstream);
    
    symbol_num = ceil(length(tx_bitstream)/2);
    
    symbol_stream = zeros(1, symbol_num);
    code = containers.Map;
    code('00') = 1/sqrt(2) + 1i/sqrt(2);
    code('01') = -1/sqrt(2) + 1i/sqrt(2);
    code('11') = -1/sqrt(2) - 1i/sqrt(2);
    code('10') =  1/sqrt(2) - 1i/sqrt(2);
    for symbol_cnt = 1:symbol_num
        symbol_stream(symbol_cnt) ... 
            = code(tx_bitstream(2*symbol_cnt-1 : 2*symbol_cnt));
    end
end