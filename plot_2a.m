function [] = plot_2a(fig2a, fig2a_stats, AXIS)
% function [] = plot_2a(fig2a, fig2a_stats)
    t_stim_on = 0;
    t_stim_off = 1000;
    t_react_min = 500;
    t_react_max = 1300;
    t_min = -500;
    t_max = 3000;
    t_shift = 1450; % average time between first and second stimulus in ms
    y_min = -1.1;
    y_max = 4;

    if ~exist('fig2a_stats', 'var') || isempty(fig2a_stats)
        alpha = 0.01;
        Nperm = 1000;
        [ fig2a_stats ] = create_fig2a_stats(fig2a, alpha, Nperm);
    end
    
    if ~exist('AXIS', 'var') || isempty(AXIS)
        % draw axis as in paper
        axes('Units','centimeters','Position',[1.398 6.8490 7.589 6.410])
    end

    % time
    time = fig2a.time;

    % convolved mean z-value data in reactivation trials of different
    % experimental conditions
    sel_stim = strcmp(fig2a.stimulus_presented,'pic1'); % select activity relative to picture 1
    z_react_main = fig2a.CN_z_react_trials_main{sel_stim};
    z_react_nocomp = fig2a.CN_z_react_trials_nocomp{sel_stim};
    z_react_q_comp = fig2a.CN_z_react_trials_qcomp{sel_stim};


    % plot convolved data
    q1 = cplot(time,z_react_main,'b');hold on
    q2 = cplot(time,z_react_nocomp,'r');
    q3 = cplot(time,z_react_q_comp,{'color',[51 162 45]/255});
    
    % plot zero line
    plot([t_min t_max],[0 0],'k','LineWidth',1)


    % plot stimulus on and offsets 
    % pic 1
    plot([t_stim_on t_stim_on],[-.95 4],'k--','Linewidth',2);
    plot([t_stim_off t_stim_off],[-.95 4],'k--','Linewidth',2);

    % pic2
    plot([t_stim_on t_stim_on]+t_shift,[-.95 4],'k--','Linewidth',2);
    plot([t_stim_off t_stim_off]+t_shift,[-.95 1.5],'k--','Linewidth',2);
    plot([t_stim_off t_stim_off]+t_shift,[2.1 4],'k--','Linewidth',2);    

    % reactivation window
    plot([t_react_min t_react_min]+t_shift,[-.75 4],'b--','Linewidth',2,'Color',[.7 .7 .7]);
    plot([t_react_max t_react_max]+t_shift,[-.95 4],'b--','Linewidth',2,'Color',[.7 .7 .7])

    % label events
    text(t_stim_off/2,-.88,'--picture 1--','horizontalalignment','center','fontsize',10)
    text(t_stim_off/2+t_shift,-.88,'--picture 2--','horizontalalignment','center','fontsize',10)
    text(t_react_min+(t_react_max-t_react_min)/2+t_shift,1.80,sprintf('reactivation\nwindow'),'horizontalalignment','center','fontsize',8,'Color',[.4 .4 .4])
    
    % plot statistics
    colors = {'k','r',[51 162 45]/255};
    perm_comparions = fieldnames(fig2a_stats)';
    Ncomp = numel(perm_comparions);

    for k = 1:Ncomp
        selected_comp = perm_comparions{k};
        plot([fig2a_stats.(selected_comp).froms_in_ms;fig2a_stats.(selected_comp).tos_in_ms],[-0.54 -0.54]+(k-1)*.08,'color',colors{k},'LineWidth',2)
        hold on
    end

    % draw X Ticks of relevant events
    set(gca,'XTick',[t_min,t_stim_on,t_stim_off/2,t_stim_off,t_stim_on+t_shift,t_react_min+t_shift,t_stim_off+t_shift,t_react_max+t_shift])
    set(gca,'XTicklabel',{'-500','0','500','1000','0','500','','1300'})

    % draw legend
    llabel1 = {'main comparison','no comparison','question comparison'};
    L1 = legend([q1.patch q2.patch q3.patch],llabel1,'fontsize',10);

    % draw stimulus N
    text(-460,3.8,'N = 61','fontsize',8)

    % label axes and define set their limits
    xlabel('time (ms)','fontsize',10);
    ylabel('{\itz}-value','fontsize',10)
    xlim([t_min t_max])
    ylim([y_min y_max])

    if numel(strfind(version,'R2021'))>0
        L1.String = llabel1;
    end
end