function [tx_bitstream, codeword_len] = lempelziv_encoder(tx_data)

    map = containers.Map;
    i_head = 1;
    i_dict= 1;
    dict = struct([]);
    
    while i_head <= length(tx_data)
        temp = tx_data(i_head);
        i_parent = 0;
        window = i_head; % start of sliding window
        %disp(i_dict);
        %disp(i_head);
        %disp("end");
        while isKey(map, temp) && i_head <= length(tx_data)
            % sub loop to find parent
            i_match = 1;
            while strcmp(dict(i_match).patt, temp)==0 && i_match <= length(dict)
                i_match = i_match+1;
            end 
            i_parent = dict(i_match).it;
            i_head = i_head + 1;
            %disp(i_dict);
            %disp(i_head);
            %disp("end");
            temp = tx_data(window:i_head);
        end
        dict(i_dict).patt = temp;
        dict(i_dict).it = i_dict;
        dict(i_dict).parent = i_parent;
        map(temp) = "whatever";
        i_dict = i_dict + 1;
        i_head = i_head + 1;
    end
    
    codeword_len = ceil(log2(i_dict-1)) + 1;
   
    tx_bitstream = "";
    for step = 1:i_dict-1
        temp = dict(step).patt;
        tx_bitstream = strcat(tx_bitstream, ...
            [dec2bin(dict(step).parent,codeword_len-1), temp(length(temp))]);
    end
end