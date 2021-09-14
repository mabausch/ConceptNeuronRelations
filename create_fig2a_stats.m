function [ fig2a_stats ] = create_fig2a_stats(fig2a, alpha, Nperm)
% function [ fig2a_stats ] = get_fig2a_statistics(fig2a)
% 
% Takes the data "fig2a" with mean convolved normalized concept neuron activity
% during reactivation trials of different experimental conditions (main, no
% comparison, question comparison) and computes cluster permutation tests results
% between the main experiment and zero or each of the control condition.

    if ~exist('alpha', 'var') || isempty(alpha)
        alpha = 0.01;
    end
    if ~exist('Nperm', 'var') || isempty(Nperm)
        Nperm = 1000;
    end

    time = fig2a.time; % time in ms

    sel_stim = strcmp(fig2a.stimulus_presented,'pic1'); % select activity relative to picture 1
    z_react_main = fig2a.CN_z_react_trials_main{sel_stim};
    z_react_nocomp = fig2a.CN_z_react_trials_nocomp{sel_stim};
    z_react_q_comp = fig2a.CN_z_react_trials_qcomp{sel_stim};

    fig2a_stats.perm_main_zero = convert_to_ms(perm_ttest(z_react_main,0,Nperm,'paired',alpha,alpha,0));
    fig2a_stats.perm_main_nocomp = convert_to_ms(perm_ttest(z_react_main,z_react_nocomp,Nperm,'paired',alpha,alpha,0));
    fig2a_stats.perm_main_qcomp = convert_to_ms(perm_ttest(z_react_main,z_react_q_comp,Nperm,'paired',alpha,alpha,0));

    % perm_ttest gives indices "froms" and "tos" that define the clusters of
    % consecutive significant differences. This functions converts these indices to
    % times in miliseconds
    function a = convert_to_ms(a)
      a.froms_in_ms = time(a.froms);
      a.tos_in_ms = time(a.tos);
    end
end