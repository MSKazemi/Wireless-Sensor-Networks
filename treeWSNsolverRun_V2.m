clear all;clc;
%% HELP
% treeNetModel.NodesParents = [0 1 1 1 2 2 3 3 5 ] this 1*7 vector that
% location(1,1) means the first nodes parent is the root in an othser word
% this node is the coordinator and the location(1,2) means second node 1
% show the name of scond node and for example (1,5)=node 5 parent is node 2
% and finaly node 9 in location (1,9) parent is node 5.
% Location x y 2D or Location x y z 3D
% treeNetModel.NodeLoc = [0 0; 1 2; 1 3;1 4;2 3;2 3;4 3;7 3;1 5];
% Node 1 in position (x,y)=(0,0), Node 2 in position (x,y)=(1,2) ...
% treeNetModel.SensRange = [30;10;10;25;10;12;15;10;5]; Node 2 sensor cverage range is 10 m
% treeNetModel.NodeP = [-15 30 -80;-15 20 -90;-15 20 -90;-15 20 -90;-15 20 -90;-15 20 -90;-15 20 -90;-15 20 -90;-15 20 -90];
% for Node 1 Ptx range is -15 dBm ~ 30 dBm and Sensivity is equal to -80 dBm
% treeNetModel.NodeBatt = [inf;2000;3000;2000;2000;2000;2000;2000;2000];coordinator
% connected to power supply so is inf j energy Node 2 Battery energy is 2000 J
% treeNetModel.Ch = 12; Channel Number
% treeWSNsolver.HTP = [] no HTP
% treeWSNsolver.HTP = [3 4;4 3;7 8] HTP between the nodes with same parent
% treeWSNsolver.Con = [] Network fully connected
% treeWSNsolver.Con = [3;5] nodes that didn't connect to the parents for
% example node 3 did not connecte to the its parent node 1 and node 5 did
% not connecte to the its parent 2
% Environment 
% treeNetModel.Gt=0; % db
% treeNetModel.Gr=0; % dB
% treeNetModel.Beta = 3;
% treeNetModel.f= 2.4*10.^9; % Hz --> StarNetModel.Ch = 12 Change

%% PRELIMINARY NETWORK and ENVIRONMENTAL INFORMATION
% TREE NETWORK MODEL
treeNetModel.NodesParents = [0 1 1 1 1 2 2 3 3 4 4 5 5];
treeNetModel.NodeLoc = [60 0;30 0;60 30;90 0;60 -30;0 0;30 30;60 60;90 30;120 0;90 -30;60 -60;30 -30];
treeNetModel.SensRange = [15;15;15;15;15;15;15;15;15;15;15;15;15]; 
treeNetModel.NodeP = [-5 15 -90;-5 15 -90;-5 15 -90;-5 15 -90;-5 15 -90;-5 15 -90;-5 15 -90;-5 15 -90;-5 15 -90;-5 15 -90;-5 15 -90;-5 15 -90;-5 15 -90];
treeNetModel.NodeBatt = [inf;7000;7000;7000;7000;7000;7000;7000;7000;7000;7000;7000;7000];
treeNetModel.Ch = 12;

% ENVIRONMENT
treeNetModel.Gt=0; % db
treeNetModel.Gr=0; % dB
treeNetModel.Beta = 3;
treeNetModel.f= 2.4*10.^9; % Hz --> StarNetModel.Ch = 12 Change


%% RUN 
disp('Tree Model Is :')
treeNetModel
%Call Solver
WSNsolver(treeNetModel,'tree')
% For test the pSuccessTree function
pSuccessTree=pSuccessTree(treeNetModel.NodesParents )