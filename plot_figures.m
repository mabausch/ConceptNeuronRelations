close all 
% get root directory
[rootdir,~,~] = fileparts(which('create_fig2c_stats'));


%% plot figure 2
figure('Resize','off','Units','centimeters','Position',[0 0 18.1 14],'PaperSize',[18.1 14],'PaperPosition',[0 0 18.1 14]);
% plot 2a 
load(fullfile(rootdir,'data','fig2a.mat'))
load(fullfile(rootdir,'data','fig2a_stats.mat'))
plot_2a(fig2a,fig2a_stats)

% plot 2b 
load(fullfile(rootdir,'data','fig2b.mat'))
plot_2b(fig2b)

% plot 2c 
[ fig2c ] = create_fig2c_data(fig2a,fig2b); %   create data of c from data of a+b
[ fig2c_stats ] = create_fig2c_stats(fig2c); %  create statistics
plot_2c(fig2c,fig2c_stats)

% add subplot labels
AxesH = axes('Parent', gcf, ...
  'Units', 'normalized', ...
  'Position', [0, 0, 1, 1], ...
  'Visible', 'off', ...
  'XLim', [0, 1], ...
  'YLim', [0, 1], ...
  'NextPlot', 'add');
text(0.035,0.985, 'a', ...
  'HorizontalAlignment', 'center', ...
  'VerticalAlignment', 'top','fontweight','bold','fontsize',16,'fontname','SansSerif')
text(0.54,0.985, 'b', ...
'HorizontalAlignment', 'center', ...
'VerticalAlignment', 'top','fontweight','bold','fontsize',16,'fontname','SansSerif')
text(0.035,0.392, 'c', ...
'HorizontalAlignment', 'center', ...
'VerticalAlignment', 'top','fontweight','bold','fontsize',16,'fontname','SansSerif')


%% plot figure 3
load(fullfile(rootdir,'data','fig3b.mat'))
load(fullfile(rootdir,'data','fig3b_stats.mat'))

figure('Position',[680 354 341 624])
plot_3b( fig3b, fig3b_stats )


%% plot figure 4
load(fullfile(rootdir,'data','fig4b.mat'))
[ fig4b_stats ] = create_fig4b_stats( fig4b );

figure('Position',[764 541 476 437])
plot_4b( fig4b, fig4b_stats )


%% plot figure 5
figure('Resize','off','Units','centimeters','Position',[0 0 16.7 18.6],'PaperSize',[16.7 18.6],'PaperPosition',[0 0 16.7 18.6]);

load(fullfile(rootdir,'data','fig5a.mat'))
load(fullfile(rootdir,'data','fig5a_stats.mat'))
plot_5a( fig5a, fig5a_stats )


load(fullfile(rootdir,'data','fig5b.mat'))
[ fig5b_stats ] = create_fig5b_stats( fig5b );
plot_5b( fig5b, fig5b_stats)


load(fullfile(rootdir,'data','fig5c.mat'))
[ fig5c_stats ] = create_fig5c_stats( fig5c );
plot_5c( fig5c, fig5c_stats )


%% plot figure 6
load(fullfile(rootdir,'data','fig6a.mat'))
load(fullfile(rootdir,'data','fig6b.mat'))
load(fullfile(rootdir,'data','fig6a_stats.mat'))
load(fullfile(rootdir,'data','fig6b_stats.mat'))
plot_6ab( fig6a, fig6b, fig6a_stats, fig6b_stats )


