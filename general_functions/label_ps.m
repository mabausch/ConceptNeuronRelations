function [] = label_ps( ps, yoffset,x_positions, Fs )

    if ~exist('x_positions','var') || isempty(x_positions)
        x_positions = 1:numel(ps);
    end

    if ~exist('Fs','var') || isempty(Fs)
        Fs=10;
    end

    if ~exist('yoffset','var')
        ylim_temp = get(gca,'YLim');
        yoffset = ylim_temp(2)*1.1;
    end

    for j = 1:numel(ps)
        newp = ps(j);
        if newp<0.05 
            text(x_positions(j),yoffset,star( newp ),'HorizontalAlignment','center','FontSize',Fs)
        end
    end
    
    function [ star_string ] = star( pval )
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
end

