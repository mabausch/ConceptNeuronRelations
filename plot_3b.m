function [  ] = plot_3b( fig3b, fig3b_stats )
%  function [  ] = plot_3b( fig3b, fig3b_stats )
    lags = fig3b.lags;
    
    %% picture 1
    axis1 = subplot(2,1,1);
    h1 = cplot(lags,fig3b.p1_crosscorr,{'b-','LineWidth',2});
    hold on,grid on
    h2 = cplot(lags,fig3b.p1_crosscorr_ctrl,{'-red','LineWidth',2});
    
    xlim([min(fig3b.lags) max(fig3b.lags)])
    ylim([0 .023])
    
    N = size(fig3b.p1_crosscorr,1);
    L = legend([h1.patch h2.patch],{sprintf('main (N=%i)',N),sprintf('controls (N=%i)',N)},'location','northeast');
    set(gca,'XTickLabel',[])
    set(gca,'YTicklabel',{'0','','0.01','','0.02',''})

    % plot statistics
    if numel(fig3b_stats.('p1').froms_in_ms)>0
        plot([fig3b_stats.('p1').froms_in_ms;fig3b_stats.('p1').tos_in_ms],[.002 .002],'color','r','LineWidth',2)
    end
    title('picture 1','fontweight','normal')
    
    %% picture 2
    axis2 = subplot(2,1,2);
    cplot(lags,fig3b.p2_crosscorr,{'b-','LineWidth',2});
    hold on,grid on
    cplot(lags,fig3b.p2_crosscorr_ctrl,{'-red','LineWidth',2});
    
    xlim([min(fig3b.lags) max(fig3b.lags)])
    ylim([0 .023])
    set(gca,'YTicklabel',{'0','','0.01','','0.02',''})
    
    % plot statistics
    if numel(fig3b_stats.('p2').froms_in_ms)>0
        plot([fig3b_stats.('p2').froms_in_ms;fig3b_stats.('p2').tos_in_ms],[.002 .002],'color','r','LineWidth',2)
    end
    title('picture 2','fontweight','normal')
    
    % Give common xlabel, ylabel and title to your figure
    han=axes(gcf,'visible','off'); 
    han.XLabel.Visible='on';
    han.YLabel.Visible='on';
    ylabel(han,'yourYLabel');
    xlabel(han,'lag (ms)','fontsize',10)
    ylabel(han,'cross correlation','fontsize',10)
    

	axis1.YAxis.Exponent=0;
	axis2.YAxis.Exponent=0;
	axis1.YAxis.TickLabelFormat = '%.3f';
	axis2.YAxis.TickLabelFormat = '%.3f';

end