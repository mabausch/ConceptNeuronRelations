function [ ] = plot_5b( fig5b, fig5b_stats)
    axes('Units','centimeters','Position', [1.5500    5.2250   13.8000    5.6000]);

    Fs = 11;
    
    a = struct2cell(fig5b.rhos);
    rhomatrix = get_boxNvsNdata( a{:} );
    N = numel(a);
    
    h = boxplot2(rhomatrix);
    
    Ncolors = size(rhomatrix,2);

    x_values = arrayfun(@(x) get(x,'XData'),h.uwhis,'Uniformoutput',0);
    x_values = unique([x_values{:}]);

    cmap = parula(Ncolors+1);
    for ii = 1:Ncolors
        structfun(@(x) set(x(ii,:), 'color', cmap(ii,:), ...
            'markeredgecolor', cmap(ii,:)), h);
    end
    set([h.lwhis h.uwhis], 'linestyle', '-');
    set(h.out, 'marker', '.');
    set(h.box,'Linewidth',2),set(h.ladj,'Linewidth',2),set(h.lwhis,'Linewidth',2),set(h.med,'Linewidth',2),set(h.out,'Linewidth',2),set(h.uadj,'Linewidth',2),set(h.uwhis,'Linewidth',2)

    ylabel('correlation strength (rho)','fontsize',10)
    xlim([-.5 3.5])
    ylim([-1 1])
    
    box on

    hold on, plot([0.5 2.5],[0 0],'k-','LineWidth',1)
    set(gca,'XTicklabel',{'',''})
    
    yyy = .8;
    sss = .15;
    text(0+sss,yyy+.05,'within bundle','horizontalalignment','center','fontsize',Fs-1,'verticalalignment','middle');
    text(3-sss,yyy+.05,'across bundles','horizontalalignment','center','fontsize',Fs-1,'verticalalignment','middle');
    
    text(0+sss,yyy-.05,sprintf('(N = %i)',numel(a{1})),'horizontalalignment','center','fontsize',Fs-3,'verticalalignment','middle');
    text(3-sss,yyy-.05,sprintf('(N = %i)',numel(a{end})),'horizontalalignment','center','fontsize',Fs-3,'verticalalignment','middle');
    

    uppertxt_y = .9;
    lowertxt_x = 1.5;
    lowertxt_y = -.4;
    
    lo = .4; ro = lo;

    text(1.5,uppertxt_y,'Pairs of concept neurons \color[rgb]{0.8392 0.3725 0.3725}n2\color[rgb]{0 0 0} and \color[rgb]{0.2745 0.2863 0.7059}n1','fontsize',Fs-2,'horizontalalignment','center'); %,'color',[214, 95, 95]/255 
    text(1.5,uppertxt_y-.12,'--picture 2--','fontsize',Fs-2,'horizontalalignment','center'); 


	text(lowertxt_x+lo,lowertxt_y-.1,'n1: 500-1300 ms','horizontalalignment','center','fontsize',Fs-2);
    text(lowertxt_x-ro,lowertxt_y-.1,'n2: 0-1000 ms','horizontalalignment','center','fontsize',Fs-2);

    text(lowertxt_x+lo,lowertxt_y-.2,'reactivation','color',cmap(1,:),'horizontalalignment','center','fontsize',Fs-2);
    text(lowertxt_x-ro,lowertxt_y-.2,'response','color',cmap(1,:),'horizontalalignment','center','fontsize',Fs-2);

    text(lowertxt_x+lo,lowertxt_y-.3,'no reactivation','color',cmap(2,:),'horizontalalignment','center','fontsize',Fs-2);
    text(lowertxt_x-ro,lowertxt_y-.3,'response','color',cmap(2,:),'horizontalalignment','center','fontsize',Fs-2);

    text(lowertxt_x+lo,lowertxt_y-.4,'reactivation','color',cmap(3,:),'horizontalalignment','center','fontsize',Fs-2);
    text(lowertxt_x-ro,lowertxt_y-.4,'no response','color',cmap(3,:),'horizontalalignment','center','fontsize',Fs-2);

    text(lowertxt_x+lo,lowertxt_y-.5,'no reactivation','color',cmap(4,:),'horizontalalignment','center','fontsize',Fs-2);
    text(lowertxt_x-ro,lowertxt_y-.5,'no response','color',cmap(4,:),'horizontalalignment','center','fontsize',Fs-2);

    text(-0.07*.95,1.01,'b','Units','normalized','fontsize',14,'fontweight','bold')
    
    % Plot significance for Wilcoxon signed rank against zero
    label_ps(fig5b_stats.rhos.p_values,.49,x_values,Fs+1)
    
    plot([1.5 1.5],[-.5 .5],'k--')
    grid on
    
    
    %%
    
    axes('Units','centimeters','Position', [2.5500 6.8250 2.4000 2.4000]);
    cmap = parula(5);

    plot(fig5b.CN_z_n2_response_within_bundles,fig5b.CN_z_n1_react_within_bundles,'.','color',cmap(1,:))
    ylim([-3 5]),xlim([-3 5])
     

    text(1,5.8,sprintf('{\\itr} = %.2f, {\\itp} = %.2E',fig5b_stats.scatters.r_values(1),fig5b_stats.scatters.p_values(1)),'HorizontalAlignment','center','fontsize',8)

    ylabel('{\itz}-value \color[rgb]{0.2745 0.2863 0.7059}(n1)','fontsize',8)
    xlabel('{\itz}-value \color[rgb]{0.8392 0.3725 0.3725}(n2)','fontsize',8)


    grid on,  h = lsline;set(h,'LineWidth',2);
    set(gca,'fontsize',8)



    axes('Units','centimeters','Position', [11.9500 6.8250 2.4000 2.4000]);

    plot(fig5b.CN_z_n2_response_across_bundles,fig5b.CN_z_n1_react_across_bundles,'.','color',cmap(1,:))
    ylim([-3 5]),xlim([-3 5])
    
    text(1,5.8,sprintf('{\\itr} = %.2f, {\\itp} = %.2E',fig5b_stats.scatters.r_values(2),fig5b_stats.scatters.p_values(2)),'HorizontalAlignment','center','fontsize',8)
    ylabel('{\itz}-value \color[rgb]{0.2745 0.2863 0.7059}(n1)','fontsize',8)
    xlabel('{\itz}-value \color[rgb]{0.8392 0.3725 0.3725}(n2)','fontsize',8)

    grid on
    box on, h = lsline;set(h,'LineWidth',2);
    set(gca,'fontsize',8,'YAxisLocation','right')

end

