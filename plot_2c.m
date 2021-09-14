function [] = plot_2c(fig2c, fig2c_stats)
    Fs = 10;

    cs.green = [51 162 45]/255;
    cs.blue = [70 73 180]/255;
    cs.lblue = [71 170 232]/300;

    cstr_green =  '\color[rgb]{0.2000 0.6353 0.1765}';
    cstr_blue =  '\color[rgb]{0.2745 0.2863 0.7059}';
    cstr_lblue =  '\color[rgb]{0.2367 0.5667 0.7733}';

    min_z = -.5;
    max_z = 2;
    %% p2_main_react vs p1_qcomp_react
    xsel = 'p2_main_react';
    ysel = 'p1_qcomp_react';
    statsel = sprintf('%s_vs_%s',xsel,ysel); 
    statind = strcmp(fig2c_stats.labels,statsel);
    
    axes('Units','centimeters','Position',[1.5980 1.3100 3.4180 3.3470])
    plot(fig2c.(xsel),fig2c.(ysel),'o','color',cs.blue), hold on, plot(fig2c.(xsel),fig2c.(ysel),'.','color',cs.green)
    title(sprintf('p2_{%smain}^{%sreact} (x) , p1_{%sq-comp}^{%sreact} (y)',cstr_blue,cstr_lblue,cstr_green,cstr_lblue),'fontsize',Fs-1,'fontweight','normal')
    
    % plot statistics and regression
    plot_statistics(statind)
    ylim([min_z max_z]),xlim([min_z max_z])
    grid on, box on, lsline
    
    % move labels
    YYY = ylabel('mean {\itz}-value','fontsize',Fs);
    YYY.Position(1) = YYY.Position(1)-.3;
    XXX = xlabel('mean {\itz}-value','fontsize',Fs);
    XXX.Units = 'centimeters';
    XXX.Position(1) = XXX.Position(1)+6.0540;
    set(gca,'YTicklabel',{'','0','','1','','2'})
    
    %% p2_main_react vs p2_qcomp_react
    xsel = 'p2_main_react';
    ysel = 'p2_qcomp_react';
    statsel = sprintf('%s_vs_%s',xsel,ysel); 
    statind = strcmp(fig2c_stats.labels,statsel);
    
    axes('Units','centimeters','Position',[5.6340 1.3100 3.4180 3.3470])
    plot(fig2c.(xsel),fig2c.(ysel),'o','color',cs.blue), hold on, plot(fig2c.(xsel),fig2c.(ysel),'.','color',cs.green)
    title(sprintf('p2_{%smain}^{%sreact} (x) , p2_{%sq-comp}^{%sreact} (y)',cstr_blue,cstr_lblue,cstr_green,cstr_lblue),'fontsize',Fs-1,'fontweight','normal')
    
    % plot statistics and regression
    plot_statistics(statind)
    ylim([min_z max_z]),xlim([min_z max_z])
    grid on, box on, lsline, set(gca,'YTicklabel',[])
    

    %% q_qcomp_response vs p1_qcomp_react
    xsel = 'q_qcomp_response';
    ysel = 'p1_qcomp_react';
    statsel = sprintf('%s_vs_%s',xsel,ysel); 
    statind = strcmp(fig2c_stats.labels,statsel);
    
    axes('Units','centimeters','Position',[9.6700 1.3100 3.4180 3.3470])
    plot(fig2c.(xsel),fig2c.(ysel),'o','color',cs.green), hold on, plot(fig2c.(xsel),fig2c.(ysel),'.','color',cs.green)
    title(sprintf('q_{%sq-comp}^{response} (x) , p1_{%sq-comp}^{%sreact} (y)',cstr_green,cstr_green,cstr_lblue),'fontsize',Fs-1,'fontweight','normal')
    %plot(q_qcomp_response,p1_qcomp_react,'o','color',cs.green),hold on, plot(q_qcomp_response,p1_qcomp_react,'.','color',cs.green)
    %title(sprintf('q_{%sq-comp}^{response} (x) , p1_{%sq-comp}^{%sreact} (y)',cstr_green,cstr_green,cstr_lblue),'fontsize',Fs-1,'fontweight','normal')
    
    
    % plot statistics and regression
    plot_statistics(statind)
    ylim([min_z max_z]),xlim([min_z max_z])
    grid on, box on, lsline, set(gca,'YTicklabel',[])
    

    % q_qcomp_response vs p2_qcomp_react
    xsel = 'q_qcomp_response';
    ysel = 'p2_qcomp_react';
    statsel = sprintf('%s_vs_%s',xsel,ysel); 
    statind = strcmp(fig2c_stats.labels,statsel);
    
    axes('Units','centimeters','Position',[13.7050 1.3100 3.4180 3.3470])
    plot(fig2c.(xsel),fig2c.(ysel),'o','color',cs.green), hold on, plot(fig2c.(xsel),fig2c.(ysel),'.','color',cs.green)
    title(sprintf('q_{%sq-comp}^{response} (x) , p2_{%sq-comp}^{%sreact} (y)',cstr_green,cstr_green,cstr_lblue),'fontsize',Fs-1,'fontweight','normal')
    
%     plot(q_qcomp_response,p2_qcomp_react,'o','color',cs.green),hold on, plot(q_qcomp_response,p2_qcomp_react,'.','color',cs.green)
%     title(sprintf('q_{%sq-comp}^{response} (x) , p2_{%sq-comp}^{%sreact} (y)',cstr_green,cstr_green,cstr_lblue),'fontsize',Fs-1,'fontweight','normal')
    
    % plot statistics and regression
    plot_statistics(statind)
    ylim([min_z max_z]),xlim([min_z max_z])
    grid on, box on, lsline, set(gca,'YTicklabel',[])
    
    function plot_statistics(statind)
    	text(.75,1.865,sprintf('{\\itr} = %.2f, {\\itp} = %.2E',fig2c_stats.rs(statind), fig2c_stats.p_values(statind)),'HorizontalAlignment','center','fontsize',Fs-2)
    	text(1.3,-.38,'N = 61','fontsize',Fs-2)
    end
end



