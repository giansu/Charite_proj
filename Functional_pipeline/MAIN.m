% prima di lanciare controlla:
% - che sia pronto il Funct_conn_r.mat, contenente due struct, ognuna con le matrici FC reali
% - che siano pronte le simulazioni, e il percorso delle simulazioni punti effettivamente al template di interesse (es. DKT)
% - che i counters G, speed, trial siano ben inizializzati

clearvars  

prompt= 'insert subject ID: ';
sub_ID = input (prompt, "s");

load('Funct_conn_r.mat');
sub_ind = find(strcmp({Funct_conn_DKT.subject}, sub_ID)==1);

AEC_r=Funct_conn_DKT(sub_ind).PLV_r;
PLV_r=Funct_conn_DKT(sub_ind).AEC_r;

%%% Specifications
freqs = [2 5 8 15 30 ;4 7 12 29 45];
fs=1000;
signal_length=6000; %total signal length
edges = 1000; %considera 1000 a da e a sx, piu in la (per FC)
good_samples = (edges+1) : signal_length - (edges); % good samples (without edges)
G_factor = 0.5;

%filt and hilb extraction
for i_G = (0.5:0.5:15) %0.5:0.5:15
    for i_speed = (1:30) %1:30
        for i_trial =(1:3) % 1:3
            name=['signal_G' num2str(i_G,'%.1f'), '_s' int2str(i_speed), '_trial' int2str(i_trial)]; % i_G `differente perche decimale
            disp(strcat(sub_ID,'/',name,': processing'))
            load(['F:/Charite/simulations/DKT/',sub_ID,'/',name,'.mat']);
            %load(['C:/Users/EQUIPO/Desktop/simulations/DKT/',sub_ID,'/',name,'.mat']);
            for i_ROI= (1:size(signal,1)) % ROI index
                x = signal(i_ROI,:);
                n = 800; % filter order (fisso a 500) .. senno per farlo rispetto alla lunghezza del campione usa "n= floor(size(x,2)/800);"

                [signal_filt, signal_filt_phases, signal_filt_amplitudes] = f_filtering ( freqs , fs , i_ROI, x , n);
                sub_proc.signal_filt (i_ROI,:,:) = signal_filt;
                sub_proc.signal_filt_phases(i_ROI,:,:) = signal_filt_phases;
                sub_proc.signal_filt_amplitudes(i_ROI,:,:) = signal_filt_amplitudes;

                % Da destinarsi a funzione indipendente
                FFTx = abs(fft(x)/size(x,2));
                FFTx_2 = FFTx(1:size(x,2)/2+1);
                FFTx_2 (2:end-1) = 2* FFTx_2 (2:end-1);
                f = fs *(0:(size(x,2)/2))/size(x,2); %(f va da 0 a 500 Hz)
                FFTx_2(1, 1: (floor(size(f,2)/500)*50)); % qui seleziono solo i campioni da 1 a 50 Hz, sapendo il n.punti totali della fft, la quale va tra 0 e 500 Hz (i.e., 1/2 fs)
                %ind= [1:1: floor(f(size(f, 2)))];
                FFTx_2(floor(f)==0)=[]; f(floor(f)==0)=[]; % eliminate DC bin contributions from the spectrum vector and the frequency indices
                sub_proc.FFT (i_ROI, :) = accumarray (floor(f)', FFTx_2'); % then extract spectrum without DC
                %plot(f, sub_proc.FFT(i_ROI,:));
                sub_proc.signal(i_ROI,:) = x;
            end

            sub_proc.FFT_mean(1,:) = mean(sub_proc.FFT(i_ROI,:),1);
            sub_proc.FFT_peak = find(sub_proc.FFT_mean == max(sub_proc.FFT_mean));

            [PLV_s, AEC_s] = f_funct_connectivity (sub_proc.signal, sub_proc.signal_filt_phases, sub_proc.signal_filt_amplitudes, good_samples, edges);
            sub_proc.PLV_s = PLV_s;
            sub_proc.AEC_s = AEC_s;
            sub_proc.signal_filt_phases = signal_filt_phases;
            sub_proc.signal_filt_amplitudes = signal_filt_amplitudes;

            [Pearson_PLV, Pearson_AEC] = f_Pearson (PLV_r, AEC_r, sub_proc.PLV_s, sub_proc.AEC_s);

            collector_corr_PLV ((2*i_G),i_speed,i_trial,:)  = Pearson_PLV (1,:); % G,speed,trial,band
            collector_corr_AEC ((2*i_G),i_speed,i_trial,:) = Pearson_AEC (1,:); % G,speed,trial,band
            collector_fpeak ((2*i_G),i_speed,i_trial,1) = sub_proc.FFT_peak;

            % Clear innecessary fields in the structure
            %fields = {'signal','signal_filt', 'signal_filt_phases','signal_filt_amplitudes','FFT','FFT_mean'};
            %sub_proc=rmfield(sub_proc, fields )
            clearvars sub_proc

        end
    end
end

f_megaplot(collector_corr_PLV, collector_corr_AEC, collector_fpeak,G_factor); % aggiungi un plot di FFT peaks
