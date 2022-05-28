function [Pearson_PLV ,Pearson_AEC] = f_Pearson(FC_PLV_r, FC_AEC_r, FC_PLV_s, FC_AEC_s)

    Pearson_PLV =zeros(1,5);
    Pearson_AEC =zeros(1,5);
    
    for band = (1:5)
        plv_real_current = FC_PLV_r (:,:,band);
        vectorized_real_PLV = plv_real_current(triu(true(size(plv_real_current)),1));
        plv_sim_current = FC_PLV_s (:,:,band);
        vectorized_sim_PLV = plv_sim_current(triu(true(size(plv_sim_current)),1));
        Pearson_PLV (1,band) = corr( vectorized_real_PLV , vectorized_sim_PLV );
        if isnan (Pearson_PLV (1,band)) == 1 % anti-NaN check (se FC simulata è composta completamente da "1" il risultato è NaN, e lo correggo per fini di visualizzazione)
            Pearson_PLV (1,band) = 0;
        end
    
        aec_real_current = FC_AEC_r (:,:,band);
        vectorized_real_AEC = aec_real_current(triu(true(size(aec_real_current)),1));
        aec_sim_current = FC_AEC_s (:,:,band);
        vectorized_sim_AEC = aec_sim_current(triu(true(size(aec_sim_current)),1));
        Pearson_AEC (1,band) = corr( vectorized_real_AEC , vectorized_sim_AEC );
        if isnan (Pearson_AEC (1,band)) == 1 % anti-NaN check (se FC simulata è composta completamente da "1" il risultato è NaN, e lo correggo per fini di visualizzazione)
            Pearson_AEC (1,band) = 0;
        end
    end

end