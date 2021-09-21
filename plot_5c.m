function [ ] = plot_5c( fig5c, fig5c_stats )

    sitenames = unique(cellfun(@(x) extractBefore(x,'_'),fig5c.labels,'UniformOutput',false),'stable');
    conditions = {'main','nocomp','qcomp'};
    
    Nsites = numel(sitenames);
    Nconditions = numel(conditions);
    
    celldata = fig5c.positional_responsediff_hedges_g;

    Ndata = cellfun('length',celldata);
    
    boxplotdata = nan(Nsites,Nconditions,max(Ndata));
    
    k = 1;
    for s = 1:Nsites
        for c = 1:Nconditions
            boxplotdata(s,c,1:Ndata(k)) = fig5c.positional_responsediff_hedges_g{k};
            
            k = k+1;
        end
    end
    
    
    axes('Units','centimeters','Position', [1.55 0.737 13.8 4]);
        
    h = boxplot2(boxplotdata,1:Nsites);
    hold on, plot([0 10],[0 0],'k')
    xlim([0 5])
    xlim([0.5 4.5])

    cmap = parula(5);

    cmap(1,:) = [76,114,176]/255;
    cmap(2,:) = [196,78,82]/255;
    cmap(3,:) = [85,168,104]/255;

    for ii = 1:3
        structfun(@(x) set(x(ii,:), 'color', cmap(ii,:), ...
            'markeredgecolor', cmap(ii,:)), h);
    end
    set([h.lwhis h.uwhis], 'linestyle', '-');
    set(h.out, 'marker', '.');
    set(h.box,'Linewidth',2),set(h.ladj,'Linewidth',2),set(h.lwhis,'Linewidth',2),set(h.med,'Linewidth',2),set(h.out,'Linewidth',2),set(h.uadj,'Linewidth',2),set(h.uwhis,'Linewidth',2)
    set(gca,'XTick',1:4)
    

    
    ax = gca;
    ax.XTickLabel = cellfun(@(a) ['\bf{' a '}'], ax.XTickLabel, 'UniformOutput',false);
    
    ylabel('Hedges g (2nd vs 1st)','fontsize',10)
    ylim([-1.2 1.49])

    text(.67,1.35-.05,'main comparison','color',cmap(1,:),'fontsize',10);
    text(.67,1.15-.05,'no comparison','color',cmap(2,:),'fontsize',10);
    text(.67,0.95-.05,'question comparison','color',cmap(3,:),'fontsize',10);


    box on
    grid on
    x_values = arrayfun(@(x) get(x,'XData'),h.uwhis,'Uniformoutput',0);
    x_values = unique([x_values{:}]);
    y_star_offset=1.05;
    
    
    N = Nsites*Nconditions;
     
    % plot raw data
    arrayfun(@(i) do_jitter(x_values(i),celldata{i}),1:N)

 
    % Plot significance for Wilcoxon signed rank against zero
    label_ps(fig5c_stats.p_values ,y_star_offset,x_values,12)
    
    

    set(gca,'XTicklabel',sitenames)
        
    text(-0.12/2.1-0.01,1.01,'c','Units','normalized','fontsize',14,'fontweight','bold')
    
    
    function do_jitter(x,ys)
        sy = size(ys);
        dataX = repmat(x,sy);
        jitterAmount = 0.05;
        jitterValuesX = 2*(rand(sy)-0.5)*jitterAmount;
        scatter(dataX+jitterValuesX,ys,4,[0 0 0],'filled','jitter','on','JitterAmount',0.06)
    end

end

