function [ fig2c ] = create_fig2c_data(fig2a,fig2b)
    time = fig2a.time;
    response_window = time>0 & time<=1000;
    reactivation_window = time>500 & time<=1300;

    fig2c.p2_main_react = mean(fig2a.CN_z_react_trials_main{2}(:,reactivation_window),2);
    fig2c.q_qcomp_response = mean(fig2b.CN_z_tworeact_trials_qcomp{1}(:,response_window),2);
    fig2c.p1_qcomp_react = mean(fig2b.CN_z_tworeact_trials_qcomp{2}(:,reactivation_window),2);
    fig2c.p2_qcomp_react = mean(fig2b.CN_z_tworeact_trials_qcomp{3}(:,reactivation_window),2);
end

