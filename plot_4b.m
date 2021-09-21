function [  ] = plot_4b( fig4b, fig4b_stats )

    %% convert raw data of four conditions to boxplot data (data_str_short : {'VN_perceptual'} {'VN_semantic'} {'CN_perceptual'} {'CN_semantic'}) 
    data_cell = struct2cell(fig4b);
    boxplotdata = get_boxNvsNdata( data_cell{:} );

    %% plot boxplot
    h = boxplot2(boxplotdata,1:2);

    %% plot p-values of comparisons against zero
    %data_str_short : {'VN_perceptual'} {'VN_semantic'} {'CN_perceptual'} {'CN_semantic'}
    
    is_zero_comparison = cellfun(@(x) max([0 strfind(x,'zero')])>0,fig4b_stats.labels);
    ps_zero = fig4b_stats.p_values(is_zero_comparison);
    
    y_star_offset = 2.1;
   
    x_values = arrayfun(@(x) get(x,'XData'),h.uwhis,'Uniformoutput',0);
    x_values = unique([x_values{:}]);

    label_ps(ps_zero, y_star_offset, x_values)
    
    
    %% plot p-values of comparisons against each other
    %data_str_short : {'VN_perceptual'} {'VN_semantic'} {'CN_perceptual'} {'CN_semantic'}
    x_value_pairs = cell(1,6); % 6 <- nchoosek(4,2)
    pairwise_ps = nan(1,6);
    k = 1;
    for i = 1:4
       for j = 1:4
           if j>i
                new_label = sprintf('%s_vs_%s',fig4b_stats.data_strs_short{i},fig4b_stats.data_strs_short{j});
                
                p = fig4b_stats.p_values(strcmp(fig4b_stats.labels,new_label));

                x_value_pairs{k} = x_values([i,j]);
                pairwise_ps(k) = p;
                k=k+1;
           end
       end
    end
    
    siginds = pairwise_ps < 0.05; % select significant indices
    
    a = sigstar(x_value_pairs(siginds),pairwise_ps(siginds));
    sigstar(x_value_pairs(siginds),pairwise_ps(siginds));
    arrayfun(@(x) set(x,'Visible','off'),a);
    
    hold on, plot([-.5 3.7],[0 0],'k-')

    %% change optics, add labels and set limits
    cmap = parula(5);
    for ii = 1:2
        N = sum(~isnan(squeeze(boxplotdata(ii,1,:))));
        text(ii,-1.8,sprintf('(N = %i)',N),'fontsize',8,'horizontalalignment','center')
        structfun(@(x) set(x(ii,:), 'color', cmap(ii,:), ...
            'markeredgecolor', cmap(ii,:)), h);
    end
    set([h.lwhis h.uwhis], 'linestyle', '-');
    set(h.out, 'marker', '.');
    set(h.box,'Linewidth',2),set(h.ladj,'Linewidth',2),set(h.lwhis,'Linewidth',2),set(h.med,'Linewidth',2),set(h.out,'Linewidth',2),set(h.uadj,'Linewidth',2),set(h.uwhis,'Linewidth',2)

    ylabel('z-value (react. window)')
    set(gca,'XTicklabel',[])

    text(1.2,-1,'perceptual question','color',cmap(1,:));
    text(1.2,-1.3,'semantic question','color',cmap(2,:));

    text(1,-2.1,'visual neurons','horizontalalignment','center');
    text(2,-2.1,'concept neurons','horizontalalignment','center');

    box on


    xlim([.5 2.5])
    ylim([-2 3.2])

end

