function treeWSNsol=treeWSNsolver(treeNetModel)
% PLOT
NodesParents=treeNetModel.NodesParents;
treeNetplot(NodesParents);
%
Gt=treeNetModel.Gt; % db
Gr=treeNetModel.Gr; % dB
Beta=treeNetModel.Beta;
f=treeNetModel.f;% Hz

[~,nodesNum]=size(NodesParents);
% HTP
% conCheck(Pt,Psens,Gt,Gr,Beta,f,dis) 
% Psens --> Node 1 a treeNetModel(a,:)
% Pt --> Node 2 b treeNetModel(b,:)
  x=1;
  treeWSNsol.HTP=[];
for i=0:nodesNum
    childeren=find(NodesParents==i); % Find the nodes with same parent i --> for parent i=1 the childeren is [2 3 4] 
    if(size(childeren)>1)
        for j=1:size(childeren,2)
             for p=1:size(childeren,2)
                 if(j~=p)
                    a=childeren(1,j); % child a and b from same parent 
                    b=childeren(1,p);
                    dis =euclideanDis(treeNetModel.NodeLoc(a,:),treeNetModel.NodeLoc(b,:));
                    if(HTPCheck(treeNetModel.NodeP(b,1),treeNetModel.NodeP(a,3),Gt,Gr,Beta,f,dis)==1)
                    treeWSNsol.HTP(x,1)=a;
                    treeWSNsol.HTP(x,2)=b;
                    x=x+1;
                    end
                 end
             end
        end
        
    end
end
HidenTerminalProblem=treeWSNsol.HTP
%% Connectivity
 x=1;
 treeWSNsol.Con=[];
 for i=1:nodesNum
     childeren=find(NodesParents==i); % Find the nodes and those parent i --> for parent i=1 the childeren is [2 3 4] 
     if(size(childeren)>0) % node with at least one child
         for j=1:size(childeren,2)
         dis =euclideanDis(treeNetModel.NodeLoc(childeren(1,j),:),treeNetModel.NodeLoc(i,:));
         if(conCheck(treeNetModel.NodeP(childeren(1,j),1),treeNetModel.NodeP(i,3),Gt,Gr,Beta,f,dis)==0)%child min Pt = NodeP(childeren(1,j),1) and parent Psens=NodeP(i,3)
            treeWSNsol.Con(x,1)=i; %parent node
            treeWSNsol.Con(x,2)=childeren(1,j); % child node this child node can not connect to the above parent
            x=x+1;
         end
         end
         
     end
 end
ConnectivityProblem=treeWSNsol.Con
end




%% Plot Node Connectivity
% Top.G1=[1 1 1 1 1 1 ];
% Top.G2=[2 3 4 5 6 7 ];
% Top.X=[0 1 5 6 8 4 1];
% Top.Y=[1 2 4 2 7 1 3];
% Removed Edge Due to Connectivity Problems
% Top.rmedgeG1=[1 5];
% Top.rmedgeG2=[2 4];
% figure('Name','Plot Node Connectivity')
% Top.G1(1,1:NumNode)=1;
% Top.G2=[2:NumNode+1];
% 
% Nodes=cellstr(num2str([0:NumNode]'))';
% Nodes(1)={'Coordinator'};
% Top.NodeLabel =Nodes;
% Top.X=horzcat(treeNetModel.CoorLoc(1,1),treeNetModel.NodeLoc(:,1)');
% Top.Y=horzcat(treeNetModel.CoorLoc(1,2),treeNetModel.NodeLoc(:,2)');
% if(size(treeWSNsol.Con)>0)
% Top.rmedgeG1(1:size(treeWSNsol.Con))=1;
% Top.rmedgeG2=treeWSNsol.Con+1; % treet Number of nodes name in program because of coordinator treeted from 2 so treeWSNsol.Con+1
% else
%     Top.rmedgeG1=[];
%     Top.rmedgeG2=[];
% end
% graphPlot(Top);
% 
% 
% %% Plot Node HTP
% 
% 
% 
% if(size(treeWSNsol.HTP,1)>0)
%     figure('Name','Plot Node HTP')
%     TopHTP.G1=treeWSNsol.HTP(:,1)';
%     TopHTP.G2=treeWSNsol.HTP(:,2)';
%     TopHTP.NodeLabel=[];
%     TopHTP.rmedgeG1=[];
%     TopHTP.rmedgeG2=[];
%     TopHTP.X=[];
%     TopHTP.Y=[];
%     graphPlot(TopHTP);
% end
% 
% 
% end


