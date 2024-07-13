function symbol_stream = mapper(tx_bitstream, modulation)
    
% Bit-to-symbol mapping for QPSK
% 00 --- 1/sqrt(2) + j * 1/sqrt(2)
% 01 --- -1/sqrt(2) + j * 1/sqrt(2)
% 11 --- -1/sqrt(2) - j * 1/sqrt(2)
% 10 --- 1/sqrt(2) + j * 1/sqrt(2)

% Input: tx_bitstream is a string, modulation is "QPSK"
% Output: symbol_stream is a vector of symbols


end