function bitstream = demapper(symbol_stream, modulation)

% demapper aims to map symbol stream to bit stream

% Input: modulation is "QPSK"
% Output: bitstream is of String type

% This line of code is for the program to run. Please remove after you finish implmenting the module.
bitstream = "";

    code = ['00'; '01'; '11'; '10'];
    point = [1/sqrt(2) + 1i/sqrt(2); 
            -1/sqrt(2) + 1i/sqrt(2); 
            -1/sqrt(2) - 1i/sqrt(2); 
            1/sqrt(2) - 1i/sqrt(2)];
% disp(scale)
    for symbol_cnt = 1:length(symbol_stream)
        input_symbol = symbol_stream(symbol_cnt);
        min_err = 1e10;
        index = 0;
        for point_cnt = 1:4
            dist = abs(input_symbol - point(point_cnt));
            if dist < min_err
                min_err = dist;
                index = point_cnt;
            end 
        end
        bitstream = strcat(bitstream, code(index,:));
    end

end