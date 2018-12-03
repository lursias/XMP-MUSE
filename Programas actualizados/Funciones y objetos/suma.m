function out=suma(varargin)

if nargin==1
    
  a=varargin{1};
  out = a;
  
elseif nargin==2
    
  a=varargin{1};
  b=varargin{2};
  out = a+b;
  
elseif nargin==3
    
  a=varargin{1};
  b=varargin{2};
  c=varargin{3};
  out = a+b+c; 
  
else
  error('suma accepts up to 3 input arguments!')
end
