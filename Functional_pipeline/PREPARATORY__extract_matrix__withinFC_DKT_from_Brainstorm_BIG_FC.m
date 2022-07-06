%% Run this script after having imported in Matlab all the general FC matrices (PLV and AEC) from Brainstorm,
%  like sub0011 and sub0012 for PLV and AEC respectively

% First, Generate for each atlas an empty struct with the 3 fields, es:
% Funct_conn_DKT.subject = [];
% Funct_conn_DKT.PLV_r   = [];
% Funct_conn_DKT.AEC_r   = [];

n_ROIs = 62;      % because we consider DKT

for row_number = 1:80

    prompt = 'Insert the number of subject: ';
    num_subject = input (prompt, "s");

    Funct_conn_DKT(row_number).subject = strcat('sub-',num_subject); % Fill subject field (first column) in output struct



    for FC_type =1:2 % i.e., for PLV and AEC, respectively

        if FC_type ==1
            FC_name = 'PLV';
        elseif  FC_type ==2
            FC_name = 'AEC';
        end

        name_struct = strcat ('sub',num_subject,num2str(FC_type)); % generate name PLV and AEC input struct(s)

        path_rois= strcat (name_struct,'.RowNames');
        n_trials = size (eval(path_rois),1)/n_ROIs;

        indices=1;
        for ii = 1 : n_ROIs*n_trials
            indices(ii+1) = indices(ii) + ii+1 ;
        end

        % DELTA

        jj=2;
        delta_middle = ones (n_ROIs*n_trials);
        delta_in = eval(name_struct).TF (:,1,1);
        for ii = 2:(size(indices,2)-1)
            temp = delta_in ((indices(ii-1)+1) : indices(ii))';
            delta_middle (jj,1:size(temp,2))= temp;
            jj = jj+1;
        end
        delta_middle = triu(delta_middle.',1) + tril(delta_middle);

        for ii = 1 : n_ROIs : (n_ROIs*n_trials)
            delta_out (:,:,(ii+(n_ROIs-1))/n_ROIs) = delta_middle (ii:ii+(n_ROIs-1),ii:ii+(n_ROIs-1));
        end
        delta_out = mean(delta_out,3);

        % THETA

        jj=2;
        theta_middle = ones (n_ROIs*n_trials);
        theta_in = eval(name_struct).TF (:,1,2);
        for ii = 2:(size(indices,2)-1)
            temp = theta_in ((indices(ii-1)+1) : indices(ii))';
            theta_middle (jj,1:size(temp,2))= temp;
            jj = jj+1;
        end
        theta_middle = triu(theta_middle.',1) + tril(theta_middle);

        for ii = 1 : n_ROIs : (n_ROIs*n_trials)
            theta_out (:,:,(ii+(n_ROIs-1))/n_ROIs) = theta_middle (ii:ii+(n_ROIs-1),ii:ii+(n_ROIs-1));
        end
        theta_out = mean(theta_out,3);

        % ALPHA

        jj=2;
        alpha_middle = ones (n_ROIs*n_trials);
        alpha_in = eval(name_struct).TF (:,1,3);
        for ii = 2:(size(indices,2)-1)
            temp = alpha_in ((indices(ii-1)+1) : indices(ii))';
            alpha_middle (jj,1:size(temp,2))= temp;
            jj = jj+1;
        end
        alpha_middle = triu(alpha_middle.',1) + tril(alpha_middle);

        for ii = 1 : n_ROIs : (n_ROIs*n_trials)
            alpha_out (:,:,(ii+(n_ROIs-1))/n_ROIs) = alpha_middle (ii:ii+(n_ROIs-1),ii:ii+(n_ROIs-1));
        end
        alpha_out = mean(alpha_out,3);

        % BETA

        jj=2;
        beta_middle = ones (n_ROIs*n_trials);
        beta_in = eval(name_struct).TF (:,1,4);
        for ii = 2:(size(indices,2)-1)
            temp = beta_in ((indices(ii-1)+1) : indices(ii))';
            beta_middle (jj,1:size(temp,2))= temp;
            jj = jj+1;
        end
        beta_middle = triu(beta_middle.',1) + tril(beta_middle);

        for ii = 1 : n_ROIs : (n_ROIs*n_trials)
            beta_out (:,:,(ii+(n_ROIs-1))/n_ROIs) = beta_middle (ii:ii+(n_ROIs-1),ii:ii+(n_ROIs-1));
        end
        beta_out = mean(beta_out,3);

        % GAMMA

        jj=2;
        gamma_middle = ones (n_ROIs*n_trials);
        gamma_in = eval(name_struct).TF (:,1,5);
        for ii = 2:(size(indices,2)-1)
            temp = gamma_in ((indices(ii-1)+1) : indices(ii))';
            gamma_middle (jj,1:size(temp,2))= temp;
            jj = jj+1;
        end
        gamma_middle = triu(gamma_middle.',1) + tril(gamma_middle);

        for ii = 1 : n_ROIs : (n_ROIs*n_trials)
            gamma_out (:,:,(ii+(n_ROIs-1))/n_ROIs) = gamma_middle (ii:ii+(n_ROIs-1),ii:ii+(n_ROIs-1));
        end
        gamma_out = mean(gamma_out,3);


        %
        if FC_type ==1
            Funct_conn_DKT(row_number).PLV_r =  cat(3, delta_out, theta_out, alpha_out, beta_out, gamma_out) ; % put the FC matrix in the output struct
        elseif FC_type ==2
            Funct_conn_DKT(row_number).AEC_r =  cat(3, delta_out, theta_out, alpha_out, beta_out, gamma_out) ; % put the FC matrix in the output struct
        end


        clearvars delta* theta* alpha* beta* gamma*

    end

end
