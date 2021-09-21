function [ star_string ] = star( pval )
% function [ star_string ] = star( pval )
%     if ~exist('x_positions','var') || isempty(x_positions)
%         x_positions = 1:numel(ps);
%     end
    
    star_string = '';

    if pval<0.05 
        if pval<0.0001
            star_string = '****'; 
        elseif pval<0.001
            star_string = '***';
        elseif pval<0.01
            star_string = '**';
        else
            star_string = '*';
        end
    end
end

