function ofdm_waveform = ofdm_modulator(symbol_stream, subcarriers, cp_length)

% You may assume the number of symbols is a multiple of the number of
% subcarriers. Please implement an OFDM modulator based on IDFT, as
% detailed in Section 11.2-5 in Digital Communications 5th edition.

% Input: 
% Symbol_stream: N complex-valued symbols, 
% subcarriers: the number of subcarriers,
% cp_length: the length of CP

% Output: ofdm_waveform is of length equal to 2 * N real-valued symbols + CP * N / #subcarriers

    step_num = ceil(...
        length(symbol_stream) / subcarriers);    % # of transmission
    ofdm_waveform = zeros(1, ... 
        step_num*cp_length + 2*length(symbol_stream));
    
    qua_subcar = 2*subcarriers;    
    step_size = cp_length+qua_subcar;
    for step = 1:step_num
        waveform_temp = ...
            [symbol_stream((step-1)*subcarriers+1 :step*subcarriers) zeros(1, subcarriers)];
        waveform_temp(1) = ...
            real(symbol_stream((step-1)*subcarriers+1));
        waveform_temp(subcarriers + 1) = ...
            imag(symbol_stream((step-1)*subcarriers + 1));
        for k = 1:subcarriers-1
            waveform_temp(qua_subcar+1-k) = conj(waveform_temp(k+1));
        end
        waveform_temp = sqrt(qua_subcar) .* ifft(waveform_temp, qua_subcar);
        ofdm_waveform((step-1)*step_size + cp_length + 1 : step*step_size) = ...
            waveform_temp(1:qua_subcar);
        ofdm_waveform((step-1)*step_size             + 1 : (step-1)*step_size + cp_length) = ...
            waveform_temp(qua_subcar-cp_length+1:qua_subcar);
    end
end