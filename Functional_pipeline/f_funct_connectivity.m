function [PLV_matrix, AEC_matrix] = f_funct_connectivity (signal, signal_filt_phases, signal_filt_amplitudes, good_samples)

% to obtain FC for DMN signal

    for i_ROI_riga = 1:size(signal,1)
        for i_ROI_col = 1:size(signal,1)
            for t = good_samples
                p_diff_delta (i_ROI_riga,i_ROI_col,t)= single( exp ( (i* (signal_filt_phases (i_ROI_riga,t,1)-signal_filt_phases (i_ROI_col,t,1)) ) ) );
                p_diff_theta (i_ROI_riga,i_ROI_col,t)= single( exp ( (i* (signal_filt_phases (i_ROI_riga,t,2)-signal_filt_phases (i_ROI_col,t,2)) ) ) );
                p_diff_alpha (i_ROI_riga,i_ROI_col,t)= single( exp ( (i* (signal_filt_phases (i_ROI_riga,t,3)-signal_filt_phases (i_ROI_col,t,3)) ) ) );
                p_diff_beta (i_ROI_riga,i_ROI_col,t)= single( exp ( (i* (signal_filt_phases (i_ROI_riga,t,4)-signal_filt_phases (i_ROI_col,t,4)) ) ) );
                p_diff_gamma (i_ROI_riga,i_ROI_col,t)= single( exp ( (i* (signal_filt_phases (i_ROI_riga,t,5)-signal_filt_phases (i_ROI_col,t,5)) ) ) );
            end

            AEC_matrix (i_ROI_riga,i_ROI_col,1) = single( corr (signal_filt_amplitudes (i_ROI_riga, good_samples ,1)',signal_filt_amplitudes (i_ROI_col, good_samples ,1)' ) );
            AEC_matrix (i_ROI_riga,i_ROI_col,2) = single( corr (signal_filt_amplitudes (i_ROI_riga, good_samples ,2)',signal_filt_amplitudes (i_ROI_col, good_samples ,2)' ) );
            AEC_matrix (i_ROI_riga,i_ROI_col,3) = single( corr (signal_filt_amplitudes (i_ROI_riga, good_samples ,3)',signal_filt_amplitudes (i_ROI_col, good_samples ,3)' ) );
            AEC_matrix (i_ROI_riga,i_ROI_col,4) = single( corr (signal_filt_amplitudes (i_ROI_riga, good_samples ,4)',signal_filt_amplitudes (i_ROI_col, good_samples ,4)' ) );
            AEC_matrix (i_ROI_riga,i_ROI_col,5) = single( corr (signal_filt_amplitudes (i_ROI_riga, good_samples ,5)',signal_filt_amplitudes (i_ROI_col, good_samples ,5)' ) );
        end
    end

PLV_matrix(:,:,1) = single( abs(sum(p_diff_delta,3 ))/length(good_samples));
PLV_matrix(:,:,2) = single( abs(sum(p_diff_theta,3 ))/length(good_samples));
PLV_matrix(:,:,3) = single( abs(sum(p_diff_alpha,3 ))/length(good_samples));
PLV_matrix(:,:,4) = single( abs(sum(p_diff_beta,3 ))/length(good_samples));
PLV_matrix(:,:,5) = single( abs(sum(p_diff_gamma,3 ))/length(good_samples));

end

