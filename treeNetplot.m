function treeNetplot(NodesParents)
% The treeplot(p,c,d)funtion was modifed by Mohsen Seyedkazemi Ardebili.
% Email: mohsen.seyedkazemi@studio.unibo.it
% Email: mohsen.seyedkazemi@gmail.com
% Copyright 1984-2013 The MathWorks, Inc. 
[x,y,h]=treelayout(NodesParents);
f = find(NodesParents~=0);
pp = NodesParents(f);
X = [x(f); x(pp); NaN(size(f))];
Y = [y(f); y(pp); NaN(size(f))];

X = X(:);
Y = Y(:);

    n = length(NodesParents);
    if n < 500,
        plot (x, y, 'ro', X, Y, 'r-');
    else
        plot (X, Y, 'r-');
    end;
xlabel(['height = ' int2str(h)]);
axis([0 1 0 1]);

% Lables of Nodes
[x,y] = treelayout(NodesParents);
text(x(1),y(1)+0.04,'Coordinator');
for i=2:length(x)
    text(x(i)+0.02,y(i),num2str(i));
end
end