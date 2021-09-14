function [] = plot_2b(fig2b)
% function [] = plot_2b(fig2b)
    % define data
    question_idx = 1;
    picture1_idx = 2;
    
    q_CN_tworeact_qcomp = fig2b.CN_z_tworeact_trials_qcomp{question_idx};
    p1_CN_tworeact_qcomp = fig2b.CN_z_tworeact_trials_qcomp{picture1_idx};
    q_CN_noreact_qcomp = fig2b.CN_z_noreact_trials_qcomp{question_idx};
    p1_CN_noreact_qcomp = fig2b.CN_z_noreact_trials_qcomp{picture1_idx};
    
    % definen time
    time = fig2b.time;

    % parameters
    min_y = 0;
    max_y = 3;
    t_min = -500;
    t_max = 3000;
    t_stim_on = 0;
    t_stim_off = 1000;
    t_shift = 1450;
    N = size(q_CN_tworeact_qcomp,1); % number of concept neurons
    
    %% plot heatmap two reactivations (preferred concept in question) relative to the question 
    axes('Units','centimeters','Position',[10.419 10.3770 2.853 2.853])
    [~,iii] = sort(mean(q_CN_tworeact_qcomp,2),'descend'); % descending sorting 
    imagesc(time,1:N,q_CN_tworeact_qcomp(iii,:),[min_y max_y])
    
    set(gca,'XTick',[])
    set(gca,'YTick',[11,61]),set(gca,'YTicklabels',{'50','0'})
    set(gca,'TickDir','out');
    
    text(-470,-6,'preferred concept in q')
    hold on, draw_question_events()
    
    
    %% plot heatmap two reactivations (preferred concept in question) relative to the picture 1 
    axes('Units','centimeters','Position',[13.799 10.3770 2.853 2.853])
    [~,iii] = sort(mean(p1_CN_tworeact_qcomp,2),'descend');
    imagesc(time,1:N,p1_CN_tworeact_qcomp(iii,:),[min_y max_y])

    g = colorbar('Units','centimeters','Position',[16.770 8.6265 0.2 2.853]);
    ylabel(g,'z-value','fontsize',10)
   
    hold on, draw_picture_events()
    set(gca,'XTick',[],'YTick',[])

    %% plot heatmap no reactivation (preferred concept not shown) relative to the question
    axes('Units','centimeters','Position',[10.419 6.8760 2.853 2.853])
    [~,iii] = sort(mean(q_CN_noreact_qcomp,2),'descend');
    imagesc(time,1:N,q_CN_noreact_qcomp(iii,:),[min_y max_y])
    text(-470,-6,'non-preferred concepts in q')
    
    % draw labels for multiple subplots
    XXX = xlabel('time (ms)','fontsize',10);
    XXX.Units = 'centimeters';XXX.Position(1) = XXX.Position(1)+1.69;
    YYY = ylabel('concept unit no.','fontsize',10);
    YYY.Units = 'centimeters';YYY.Position(2) = YYY.Position(2)+1.7505;

    hold on, draw_question_events()
    set(gca,'YTick',[11,61]),set(gca,'YTicklabels',{'50','0'})
    set(gca,'XTick',[t_stim_on, t_stim_off])
    set(gca,'TickDir','out');

    %% plot heatmap no reactivation (preferred concept not shown) relative to picture 1
    axes('Units','centimeters','Position',[13.799 6.8760 2.853 2.853],'YAxisLocation','right')
    [~,iii] = sort(mean(p1_CN_noreact_qcomp,2),'descend');
    imagesc(time,1:N,p1_CN_noreact_qcomp(iii,:),[min_y max_y])
    
    hold on, draw_picture_events()
    set(gca,'YTick',[])
    set(gca,'XTick',[t_stim_on, t_stim_off])
    set(gca,'TickDir','out');
    
    %%
    colormap(jet)
    function draw_picture_events()
        plot([t_stim_on t_stim_on],[0 N],'w--','Linewidth',2)
        plot([t_stim_off t_stim_off],[0 N],'w--','Linewidth',2)
        plot([t_stim_on t_stim_on]+t_shift,[0 N],'w--','Linewidth',2)
        plot([t_stim_off t_stim_off]+t_shift,[0 N],'w--','Linewidth',2)
        text(100, 55,'p1','fontsize',10,'Color',[1 1 1])
        text(100+t_shift, 55,'p2','fontsize',10,'Color',[1 1 1])
        xlim([t_min t_max])
    end

    function draw_question_events()
        plot([t_stim_on t_stim_on],[0 N],'w--','Linewidth',2)
        text(100, 55,'q','fontsize',10,'Color',[1 1 1])
        xlim([t_min t_max])
    end
end