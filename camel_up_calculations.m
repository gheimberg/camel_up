% camel up calculation

%% when should you pick up a bet vs get 1 point


num_probs = 1000;
num_ticks = 6;

prob_vec = linspace(0,1,num_probs);
[x,y] = meshgrid(prob_vec, prob_vec);

reward_vec = [2,3,5];

for reward_ind = 1:3
    
    reward = reward_vec(reward_ind);
    expect_score = x*1 + y*reward - (1-x-y)*1;
    expect_score((x+y)>1) = nan;
    
    figure(1)
    subplot(1,3,reward_ind);
    h = sanePColor(prob_vec, prob_vec, expect_score);
    set(h, 'EdgeColor', 'none');


    daspect([1 1 1]);
    caxis([-1 5])
    title([num2str(reward) ' point reward']);

    ticks = linspace(0,1,num_ticks);
    
    if reward_ind ==1
    ylabel('p(first place)');
    xlabel('p(second place)');
    set(gca, 'XTick', ticks, 'XTickLabel' , arrayfun(@num2str, ticks, 'UniformOutput', 0));
    set(gca, 'YTick', ticks, 'YTickLabel' , arrayfun(@num2str, ticks, 'UniformOutput', 0));
    %colorbar;
    else
        set(gca, 'XTick', []);
        set(gca, 'YTick', []);
    end
    
    expect_score((x+y)>1) = nan;
    
    figure(2);
    subplot(1,3,reward_ind);
    

    nan_inds = isnan(expect_score);
    expect_score = double(expect_score>1);
    expect_score(nan_inds) = nan;
    
    h = sanePColor(prob_vec, prob_vec, double(expect_score));
    set(h, 'EdgeColor', 'none');
    ylabel('p(first place)');
    xlabel('p(second place)');
    set(gca, 'XTick', ticks, 'XTickLabel' , arrayfun(@num2str, ticks, 'UniformOutput', 0));
    set(gca, 'YTick', ticks, 'YTickLabel' , arrayfun(@num2str, ticks, 'UniformOutput', 0));
    title([num2str(reward) ' point reward']);
    daspect([1 1 1])
end

%%

% roll ordering
camel_order = randsample(5,5);

% roll value
roll_values = randsample(3,5, 1);







