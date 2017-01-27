function pSuccessTree=pSuccessTree(treeVector)
treeNetplot(treeVector);
totalNumNodes=size(treeVector,2)-1; % minens one because of coordinator 
nodeParentLevelChilderen=vectorToNodeParentLevelChilderen(treeVector);
maxlevel=max(nodeParentLevelChilderen(:,3));
D=20;
SO=3;
Pcon=1; % in level l connectivity is ...I have cooncte this section to treeWSNSolver

% levelChar the matrix for different level charactersitics e.g. level,
% nodes, routers, probability the node be in level and prob that level have
% portion of time in order to transmit the data Psd
for l=1:maxlevel
    levelChar(l,1)=l;
    nodesInLevell=find(nodeParentLevelChilderen(:,3)==l);
    levelChar(l,2)=size(nodesInLevell,1);% Number of Nodes in Level i
    routersInLevell=find(nodeParentLevelChilderen(nodesInLevell,4)>0);% Routers in level l
    levelChar(l,3)=size(routersInLevell,1); % Number of routers in level l
    levelChar(l,4)=levelChar(l,2)./totalNumNodes;
    levelChar(l,5)=probPortionSD(l);
    levelChar(l,6)=D;
    levelChar(l,7)=SO;
    levelChar(l,8)=Pcon; % Prob of connectivity of level l
end
% levelChar the matrix for different level charactersitics.
disp('The number of nodes and routers in each level and probability of the node be in the different level and connected to different router show in below ');
fprintf(' Level - #Nodes - #Routers - Prob. In L - Prob Portion SD -  D - SO  - Pcon\r\n');
fprintf('  %2.0f      %2.0f         %2.0f       %1.2f          %1.2f            %3.0f  %2.0f    %2.0f \r\n',levelChar');
% find routeres that means nodes at leaste with one child
routeres=find(nodeParentLevelChilderen(:,4)>0); 
disp('This nodes are router');
disp('Attention please the first one is not a router is the coordinator.');
disp(routeres);
% Prob in level l and connected to router i : Number of Childeren of Router i /Total Numberes of Nodes
for i=1:size(routeres,1) % Router i
    probInLeveliConToRouterj(i,1)=nodeParentLevelChilderen(routeres(i,1),1);    % Node Name of Router
    probInLeveliConToRouterj(i,2)=nodeParentLevelChilderen(routeres(i,1),3);     % Level of router
    probInLeveliConToRouterj(i,3)=nodeParentLevelChilderen(routeres(i,1),4);    % Num of Childeren of router
    probInLeveliConToRouterj(i,4)=nodeParentLevelChilderen(routeres(i,1),4)./levelChar(nodeParentLevelChilderen(routeres(i,1),3)+1,2); %Percentage of nodes in this level (in level of router +1) that connected to this router
    probInLeveliConToRouterj(i,5)=nodeParentLevelChilderen(routeres(i,1),4)./(totalNumNodes);% percentage of total nodes connected to this router
   
end
% Print of Routeres Information In CMD:
 fprintf('Router   Level  #Childeren   Prob in This Lev   Prob in Total    \r\n');
 fprintf('  %2.0f      %2.0f       %1.0f            %1.2f               %2.2f        \n',probInLeveliConToRouterj');
for i=1:maxlevel
    pSuccess(i,1)=i; %level
    pSuccess(i,2)=Ps_L(i,levelChar,probInLeveliConToRouterj);
    pSuccess(i,3)=1;
    for j=1:i
    pSuccess(i,3)=pSuccess(j,2)*pSuccess(i,3);
    end
end
pSuccess
pSuccessTree=sum(pSuccess(:,3));
end
