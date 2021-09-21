function [ fig4b_stats ] = create_fig4b_stats( fig4b )

    neuron_types = {'VN','CN'}; % visual neuron or concept neuron
    trial_types = {'perceptual','semantic',};

    %% compare all 4 neuron-trial type combinations with zero
    fig4b_stats.data_strs = cell(1,4);
    fig4b_stats.data_strs_short = cell(1,4);
    
    fig4b_stats.labels = {};
    fig4b_stats.p_values = [];
    fig4b_stats.z_values = [];
    
    k = 1;
    for nt = 1:2
        for tt = 1:2 
            neuron_type = neuron_types{nt};
            trial_type = trial_types{tt};
            
            data_str = sprintf('z_react_main_%s_%s',neuron_type,trial_type);
            data_str_short = sprintf('%s_%s',neuron_type,trial_type);
            fig4b_stats.data_strs{k} = data_str;
            fig4b_stats.data_strs_short{k} = data_str_short;
            
            [p,~,stats] = signrank(fig4b.(data_str),0);
            
            
            fig4b_stats.labels{end+1} = sprintf('%s_vs_zero',data_str_short);
            fig4b_stats.p_values(end+1) = p;
            fig4b_stats.z_values(end+1) = stats.zval;
            
            k=k+1;
        end
    end
    
    %% compare all 4 neuron-trial type combinations with each other
    for i = 1:4
        for j = 1:4
            if j>i
                x = fig4b.(fig4b_stats.data_strs{i});
                y = fig4b.(fig4b_stats.data_strs{j});
                
                [p,~,stats] = ranksum(x,y);
                
                fig4b_stats.labels{end+1} = sprintf('%s_vs_%s',fig4b_stats.data_strs_short{i},fig4b_stats.data_strs_short{j});
                fig4b_stats.p_values(end+1) = p;
                fig4b_stats.z_values(end+1) = stats.zval;
            end
        end
    end
end

