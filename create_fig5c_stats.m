function [ fig5c_stats ] = create_fig5c_stats( fig5c )

    a = fig5c.positional_responsediff_hedges_g;
    N = numel(a);
    
    fig5c_stats.labels = cellfun(@(x) sprintf('z_%s_vs_0',x),fig5c.labels,'UniformOutput',false);
    fig5c_stats.p_values = nan(1,N);
    
    for i = 1:N
        p = signrank(a{i},0);
        fig5c_stats.p_values(i) = p;
    end

end

