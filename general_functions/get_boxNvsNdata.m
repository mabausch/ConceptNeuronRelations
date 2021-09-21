function [ output ] = get_boxNvsNdata( varargin )
% function [ output ] = get_box4vs4data( a,b,c,d,e,f,g,h )
    N = nargin;
    n = N/2;
    
    assert(mod(N,2)==0,'please provide an even number of inputs!')
    varargin_Ns = cellfun(@(x) numel(x),varargin);
    
    MAX = max(varargin_Ns);
    
    output = nan(2,n,MAX);
    
    n1list = [ones(1,n),ones(1,n)+1];
    n2list = [1:n 1:n];
    
    for i = 1:N
       output(n1list(i),n2list(i),1:varargin_Ns(i)) = varargin{i}; 
    end
    
end

