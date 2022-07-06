% Questo script è per estrarre FC e power peaks direttamente dalle serie temporali di
% Brainstorm, e compilare automaticamente la tabella "funct_connectivity"

%%
%qui facciamo il folding delle time series (qst parte lasciarla solo se serve: è per leggere dati bruti da formattazione Brainstorm)
prompt = ('insert n_trials for this subject: ');
n_trials = input(prompt);
signal = permute(reshape(s033_broad.Value',[8000,68,n_trials]),[2,1,3] );
%%

freqs = [2 5 8 15 30 ;4 7 12 29 45];

fs=1000;
signal_length=8000; %total signal length
edges = 2000; %considera edges a da e a sx, piu in la (per FC)
good_samples = (edges+1) : signal_length - (edges); % good samples (without edges)


for i_trial =(1: size (signal, 3)) %
    disp(strcat(int2str(i_trial),'/',int2str(size (signal, 3)),' processing'))
            for i_ROI= (1:size(signal,1)) % ROI index
                x = signal(i_ROI,:,i_trial);
                n = 800; % FIR filter order (fixed to 800)

                [signal_filt, signal_filt_phases, signal_filt_amplitudes] = f_filtering ( freqs , fs , i_ROI, x , n);
                sub_proc(i_trial).signal_filt (i_ROI,:,:) = signal_filt;
                sub_proc(i_trial).signal_filt_phases(i_ROI,:,:) = signal_filt_phases;
                sub_proc(i_trial).signal_filt_amplitudes(i_ROI,:,:) = signal_filt_amplitudes;

                % Da destinarsi a funzione indipendente
                FFTx = abs(fft(x)/size(x,2));
                FFTx_2 = FFTx(1:size(x,2)/2+1);
                FFTx_2 (2:end-1) = 2* FFTx_2 (2:end-1);
                f = fs *(0:(size(x,2)/2))/size(x,2); %(f va da 0 a 500 Hz)
                FFTx_2(1, 1: (floor(size(f,2)/500)*50)); % qui seleziono solo i campioni da 1 a 50 Hz, sapendo il n.punti totali della fft, la quale va tra 0 e 500 Hz (i.e., 1/2 fs)
                %ind= [1:1: floor(f(size(f, 2)))];
                FFTx_2(floor(f)==0)=[]; f(floor(f)==0)=[]; % eliminate DC bin contributions from the spectrum vector and the frequency indices
                sub_proc(i_trial).FFT (i_ROI, :) = accumarray (floor(f)', FFTx_2'); % then extract spectrum without DC
                %plot(f, sub_proc.FFT(i_ROI,:));
                sub_proc(i_trial).signal(i_ROI,:) = x;
            end

            sub_proc(i_trial).FFT_mean(1,:) = mean(sub_proc(i_trial).FFT(i_ROI,:),1);
            sub_proc(i_trial).FFT_peak = find(sub_proc(i_trial).FFT_mean == max(sub_proc(i_trial).FFT_mean));

            [PLV, AEC] = f_funct_connectivity (sub_proc(i_trial).signal, sub_proc(i_trial).signal_filt_phases, sub_proc(i_trial).signal_filt_amplitudes, good_samples, edges);
            sub_proc(i_trial).PLV  = PLV;
            sub_proc(i_trial).AEC  = AEC;
            sub_proc(i_trial).signal_filt_phases= signal_filt_phases;
            sub_proc(i_trial).signal_filt_amplitudes = signal_filt_amplitudes;
end


avg_PLV=zeros(size(signal,1),size(signal,1), size(freqs,2));
avg_AEC=zeros(size(signal,1),size(signal,1), size(freqs,2));
for bb=1:size(freqs,2)    
    for ii=1:size(sub_proc,2)
        avg_PLV(:,:,bb)=avg_PLV(:,:,bb) + sub_proc(ii).PLV(:,:,bb);
        avg_AEC(:,:,bb)=avg_AEC(:,:,bb) + sub_proc(ii).AEC(:,:,bb);
    end
    avg_PLV(:,:,bb)=avg_PLV(:,:,bb)/size(sub_proc,2);
    avg_AEC(:,:,bb)=avg_AEC(:,:,bb)/size(sub_proc,2);
end

%% Qui va a compilare la tabella "funct_connectivity"

prompt = ('insert subject name: ')
sub_ID = input(prompt, "s")
sub_ind = find(strcmp({Funct_conn_DKT.subject}, sub_ID)==1 );

Funct_conn_DKT(sub_ind).FFT_peak_byGS = mean([sub_proc.FFT_peak]);
Funct_conn_DKT(sub_ind).AEC_r_byGS = avg_AEC;
Funct_conn_DKT(sub_ind).PLV_r_byGS = avg_PLV;
