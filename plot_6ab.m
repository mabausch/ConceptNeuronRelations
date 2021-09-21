function [ ] = plot_6ab( fig6a, fig6b, fig6a_stats, fig6b_stats )
    figure('Position',[551    42   539   774])

    colors = get_seaborn;
    Fs = 12;

    gap = [.08 .08];
    marg_h = [.08 .05];
    marg_w = [.13 .1];
    
    y_min = -.4;
    y_max = .7;
    x_min = -1000;
    x_max = 2000;

    time = fig6a.time;
   
    
    %% plot 6a
    ax1 = subtightplot(2,1,1,gap,marg_h,marg_w);
    q1 = cplot(time,fig6a.CN_z_qcomp_response_q_vs_pref_pic1,{'Color',[51 162 45]/300});hold on
    q2 = cplot(time,fig6a.CN_z_qcomp_response_q_vs_nonpref_pic2,{'Color',colors{5}});

    set(gca,'XTick',[])
    ylabel('{\itz}-value','fontsize',Fs)
    title('Activity-silent reactivation during response prompt','fontweight','normal')

    llabel1 = {'q vs 1st pic (preferred)','q vs 2nd pic (non-preferred)'};
    L1 = legend([q1.patch q2.patch],llabel1,'fontsize',Fs-1,'location','northwest');
    text(50,-.33,sprintf('-- prompt reveals comparison --'),'fontsize',Fs,'Color',colors{2}/1.5)
    text(1900,.65,'N = 61','fontsize',Fs,'horizontalalignment','right')
    set(ax1,'Fontsize',Fs)
    
    xlim([x_min x_max])
    ylim([y_min y_max])
    
    plot([time(1) time(end)],[0 0],'k--')
    plot([0 0],[-.4 .7],'--','Color',colors{2}/1.5,'linewidth',2)

    % plot statistics
    arrayfun(@(x,y) plot(x:y,repmat(-.25,1,numel(x:y)),'k','LineWidth',2,'Color',[.4 .4 .4]),fig6a_stats.froms_in_ms, fig6a_stats.tos_in_ms)
    

    %% plot 6b
    ax2 = subtightplot(2,1,2,gap,marg_h,marg_w);
    q3 = cplot(time,fig6b.nonVS_z_qcomp_response_q_vs_pref_pic1,{'Color',colors{1}}); hold on
    q4 = cplot(time,fig6b.nonVS_z_qcomp_response_q_vs_nonpref_pic2,{'Color',colors{2}});
    
    xlabel('time relative to response prompt (ms)','fontsize',Fs)
    ylabel('{\itz}-value','fontsize',Fs)
    title('Non-specific early activation','fontweight','normal')

    llabel2 = {'q vs 1st pic (preferred)','q vs 2nd pic (non-preferred)'};
    L2 = legend([q3.patch q4.patch],llabel2,'fontsize',Fs-1,'location','southwest'); 

    text(1900,.65,sprintf('N = %i',size(fig6b.nonVS_z_qcomp_response_q_vs_pref_pic1,1)),'fontsize',Fs,'horizontalalignment','right')
    set(ax2,'Fontsize',Fs)

    xlim([x_min x_max])
    ylim([y_min y_max])

    plot([time(1) time(end)],[0 0],'k--')
    plot([0 0],[-.4 .7],'--','Color',colors{2}/1.5,'linewidth',2)

    % plot statistics
    arrayfun(@(x,y) plot(x:y,repmat(-.25,1,numel(x:y)),'k','LineWidth',2,'Color',[.4 .4 .4]),fig6b_stats.froms_in_ms, fig6b_stats.tos_in_ms)


    
    % plot subplot letters
    AxesH = axes('Parent', gcf, ...
      'Units', 'normalized', ...
      'Position', [0, 0, 1, 1], ...
      'Visible', 'off', ...
      'XLim', [0, 1], ...
      'YLim', [0, 1], ...
      'NextPlot', 'add');
    text(0.03,.97,'a','Units','normalized','fontsize',14,'fontweight','bold')
    text(0.03,.495,'b','Units','normalized','fontsize',14,'fontweight','bold')


    if numel(strfind(version,'R2021'))>0
        L1.String = llabel1;
        L2.String = llabel2;
    end
end

