function symbol_stream = ofdm_demodulator(waveform, subcarriers, cp_length, channel_response)

% Hint: CP length could be different from the length of channel response

% Input: channel_response is a vector, indicating the impulse response
% Output: symbol_stream is a vector of symbols

% This line of code is for the program to run. Please remove.

%%% here i just use fft from matlab

    qua_subcar = subcarriers*2;
    chops = qua_subcar + cp_length;
    symbols_cnt = floor(length(waveform) / chops);
    symbol_stream = zeros(1, symbols_cnt*subcarriers);
   
    for step = 0:symbols_cnt-1 
        temp = waveform(step*chops+1 : (step+1)*chops); % chop off part of wave
        sample = temp(cp_length+1 : end);
        X = (1/sqrt(qua_subcar)) .* fft(sample, qua_subcar) ./ fft(channel_response, qua_subcar);
        X(1) = X(1) + 1i*X(subcarriers+1);

        symbol_stream(step*subcarriers+1 : (step+1)*subcarriers) = X(1:subcarriers);
    end


end