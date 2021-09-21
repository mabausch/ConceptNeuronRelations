function [ ] = plot_5a( fig5a, fig5a_stats, axvect )
    % todo : add statistics
    t_echo_min = -300;
    t_echo_max = 100;
    time = fig5a.time;
    
    t_max = 3000;
    t_min = -500;
    
    y_max = 4.8;
    y_min = -1.1;
    
    
    %% left side
    if ~exist('axvect','var') || isempty(axvect)    
        axes('Units','centimeters','Position',[1.5000 12.1000 7.2900 6.0000])
    else
        if numel(axvect)==2 && iscell(axvect)
            axes(axvect{1})
        else
            error('axvect must be cell of two axes or empty.')
        end
    end
    
    data1 = fig5a.CN_z_picture1_pic1preferred;
    data2 = fig5a.CN_z_picture1_pic2preferred;
    q1=cplot(time,data1,'b');hold on
    q2=cplot(time,data2,'r');
    
    
    xlabel('time from stimulus onsets (ms)','fontsize',10)
    ylabel('z-value','fontsize',10)

    % plot various lines and windows
    plot([0 0],[-.95 4.4],'k--','Linewidth',2);
    plot([1000 1000],[-.95 4.4],'k--','Linewidth',2);
    plot([0 0]+1450,[-.95 4.4],'k--','Linewidth',2);
    plot([1000 1000]+1450,[-.95 4.4],'k--','Linewidth',2);

    plot([t_echo_min t_echo_min]+1450,[-.3 2.15],'b--','Linewidth',2,'Color',[.5 .5 .5]); % -.95
    plot([t_echo_max t_echo_max]+1450,[-.3 2.15],'b--','Linewidth',2,'Color',[.5 .5 .5]);
    plot([t_echo_min t_echo_min]+1450,[2.9 3.9],'b--','Linewidth',2,'Color',[.5 .5 .5]); % -.95
    plot([t_echo_max t_echo_max]+1450,[2.9 3.9],'b--','Linewidth',2,'Color',[.5 .5 .5]);

    text(500,-.88,'--picture 1--','horizontalalignment','center','fontsize',9)
    text(500+1450,-.88,'--picture 2--','horizontalalignment','center','fontsize',9)
    text(-100+1450,2.53,sprintf('anticipation\nwindow'),'horizontalalignment','center','fontsize',8,'Color',[.2 .2 .2])
    text(-400,4.55,sprintf('main comparison'),'fontsize',10,'Color',[0 0 0])
    text(2500,4.55,'N = 61','fontsize',8)
    
    YYY = 1.5;
    plot([500 500]+1450,[-.3 YYY],'b--','Linewidth',2,'Color',[0.4157    0.3529    0.8039])
    plot([1300 1300]+1450,[-.3 YYY],'b--','Linewidth',2,'Color',[0.4157    0.3529    0.8039])
    plot([500 500]+1450,[YYY+.6 3.2],'b--','Linewidth',2,'Color',[0.4157    0.3529    0.8039])
    plot([1300 1300]+1450,[YYY+.6 3.2],'b--','Linewidth',2,'Color',[0.4157    0.3529    0.8039])
    text(900+1450,1.68,sprintf('reactivation\nwindow'),'horizontalalignment','center','fontsize',8,'Color',[0.4157    0.3529    0.8039])% [71 170 232]/300)%
    
    set(gca,'XTick',[-500,0,500,1000,0+1450,500+1450,1000+1450])
    set(gca,'XTicklabel',{'-500','0','500','1000','0','500','1000'})
    xlim([t_min t_max])
    ylim([y_min y_max])
    
    text(-0.115,1.01,'a','Units','normalized','fontsize',14,'fontweight','bold')
    
    
    % plot statistics
    arrayfun(@(x) plot([x.froms_in_ms, x.tos_in_ms],-[.6 .6]+.06,'k','LineWidth',2),fig5a_stats.twopref_vs_zero)
    arrayfun(@(x) plot([x.froms_in_ms, x.tos_in_ms],-[.6 .6]+.06,'r--','LineWidth',1),fig5a_stats.twopref_vs_zero)
    
    arrayfun(@(x) plot([x.froms_in_ms, x.tos_in_ms],-[.52 .52]+.06,'b','LineWidth',2),fig5a_stats.onepref_vs_twopref_pos)
    arrayfun(@(x) plot([x.froms_in_ms, x.tos_in_ms],-[.52 .52]+.06,'r--','LineWidth',1),fig5a_stats.onepref_vs_twopref_pos)
    
    arrayfun(@(x) plot([x.froms_in_ms, x.tos_in_ms],-[.52 .52]+.06,'b','LineWidth',2),fig5a_stats.onepref_vs_twopref_neg)
    arrayfun(@(x) plot([x.froms_in_ms, x.tos_in_ms],-[.52 .52]+.06,'r--','LineWidth',1),fig5a_stats.onepref_vs_twopref_neg)
    

    
    %% right side
    if ~exist('axvect','var') || isempty(axvect)    
        axes('Units','centimeters','Position',[9.3030   12.1000    5.9840    6.0000])
    else
        axes(axvect{2})
    end
    

    q1 = cplot(time,fig5a.CN_z_picture1_pic1preferred,'b');hold on
    q2 = cplot(time,fig5a.CN_z_picture2_pic2preferred,'r');
    

    xlim([-500 1500])
    ylim([-1 6.5])

    ylabel('z-value (preferred resp.)','fontsize',10)
    xlabel('time from picture onset (ms)','fontsize',10)
    llabel = {'preferred concept first','preferred concept second'};
    L = legend([q1.patch,q2.patch],llabel,'fontsize',9);
    

    xl = get(gca,'Xlabel');
    xlpos = get(xl,'Position');
    xlpos(2) = xlpos(2)*0.95;
    set(xl,'Position',xlpos);
    
    
    set(gca,'YAxisLocation','right')
    
    % plot statistics
    arrayfun(@(x,y) plot([x,y],-[.6 .6]+.06,'Color',[.4 .4 .4],'LineWidth',2),fig5a_stats.onepref_vs_twopref_direct_pos.froms_in_ms,fig5a_stats.onepref_vs_twopref_direct_pos.tos_in_ms)
    arrayfun(@(x,y) plot([x,y],-[.6 .6]+.06,'Color',[.4 .4 .4],'LineWidth',2),fig5a_stats.onepref_vs_twopref_direct_neg.froms_in_ms,fig5a_stats.onepref_vs_twopref_direct_neg.tos_in_ms)
    
    
   if numel(strfind(version,'R2021'))>0
        L.String = llabel;
    end
    
end

