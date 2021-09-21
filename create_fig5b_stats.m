function [ fig5b_stats ] = create_fig5b_stats( fig5b )

    a = struct2cell(fig5b.rhos);
    N = numel(a);
    
    fig5b_stats.rhos.labels = fieldnames(fig5b.rhos);
    fig5b_stats.rhos.p_values = nan(1,N);
    fig5b_stats.rhos.z_values = nan(1,N);
    
    for i = 1:N
        [p,~,stat] = signrank(a{i},0);
        fig5b_stats.rhos.p_values(i) = p;
        fig5b_stats.rhos.z_values(i) = stat.zval;
    end
    
    [r_within,pval_within] = corr(fig5b.CN_z_n2_response_within_bundles,fig5b.CN_z_n1_react_within_bundles);
    [r_across,pval_across] = corr(fig5b.CN_z_n2_response_across_bundles,fig5b.CN_z_n1_react_across_bundles);
    
    fig5b_stats.scatters.labels = {'Pearson corr: z_n2resp and z_n1react within bundles','Pearson corr: z_n2resp and z_n1react across bundles'};
    
    fig5b_stats.scatters.p_values = [pval_within pval_across];
    fig5b_stats.scatters.r_values = [r_within r_across];
end

