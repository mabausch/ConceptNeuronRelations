function [ H ] = cplot( t,y,lineProps,transparent)

    if ~exist('lineProps','var') || isempty(lineProps)
		lineProps = [];
    end
    
    if ~exist('transparent','var') || isempty(transparent)
		transparent = [];
    end
    
    N = size(y,1);
    Y = mean(y);
    SEM = std(y)/sqrt(N);
    
    
    H = shadedErrorBar(t,Y,SEM,lineProps,transparent);
end

