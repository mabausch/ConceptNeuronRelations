function [ palette,palette_str ] = get_seaborn(  )
% function [ palette ] = get_seaborn(  )
    range = 1;
    chosen_palette = 'deep';


    switch chosen_palette 
        case 'deep'
            pal = {'#4C72B0', '#DD8452', '#55A868', '#C44E52', '#8172B3','#937860', '#DA8BC3', '#8C8C8C', '#CCB974', '#64B5CD','#000000'};
    end
    palette = cellfun(@(x) hex2rgb(x,range),pal,'Uniformoutput',0);
    palette_str = cellfun(@(x) sprintf('\\color[rgb]{%.4f %.4f %.4f}',hex2rgb(x,range)),pal,'Uniformoutput',0); 
end

