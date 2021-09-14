function [ fig2c_stats ] = create_fig2c_stats(fig2c)
    corr_x_data_labels = {'p2_main_react','q_qcomp_response'};
    corr_y_data_labels = {'p1_qcomp_react','p2_qcomp_react'};
    fig2c_stats.labels = cell(1,4);
    fig2c_stats.rs = nan(1,4);
    fig2c_stats.p_values = nan(1,4);
    
    k = 1;
    for i = corr_x_data_labels
        for j = corr_y_data_labels
            
            xdata = fig2c.(i{1});
            ydata = fig2c.(j{1});
            [r, pval] = corr(xdata,ydata);
            
            fig2c_stats.labels{k} = sprintf('%s_vs_%s',i{1},j{1});
            fig2c_stats.rs(k) = r;
            fig2c_stats.p_values(k) = pval;
            
            k=k+1;
        end
    end
end

