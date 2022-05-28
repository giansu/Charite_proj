function [signal_filt, signal_filt_phases, signal_filt_amplitudes] = f_filtering (freqs , fs , i_ROI , x , n)

    for bb= (1:size(freqs,2)) % bands
        f1 = freqs (1,bb);
        f2 = freqs (2,bb);
        WnA = (2* f1 /  fs);
        WnB = (2* f2 /  fs);
        b = fir1(n,[WnA WnB]);
        temp_filt = filtfilt(b, 1, x);
        temp_filt_hilb = hilbert(temp_filt);
        signal_filt (1,:,bb)=temp_filt;
        signal_filt_phases(1,:,bb) = atan2(imag(temp_filt_hilb),real(temp_filt_hilb));
        signal_filt_amplitudes(1,:,bb) =abs(temp_filt_hilb);
    end

end
