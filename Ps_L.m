function Ps_L=Ps_L(level,levelChar,probInLeveliConToRouterj)
% Ps_L menase success probability of packet transmission from level l to
% level l-1.
Pcon=levelChar(level,8);
probPortionSD=levelChar(level,5);
if(level-1==0)
   routersL_1=1; % Coordinator
else
    routersL_1=find(probInLeveliConToRouterj(:,2)==level-1);% Routers in level L-1
end
xp=0;
for i=1:size(routersL_1,1)
    pLI=probInLeveliConToRouterj(routersL_1(i,1),5); % pLI --> Pl|i Prob nodes in level l connected to the node i in level l-1
    nLI=probInLeveliConToRouterj(routersL_1(i,1),3); % nLI --> Nl|i Number of nodes in level l that connceted to the router i in level l-1
    sizeOfPacket=levelChar(level,6);
    SO=levelChar(level,7);
    xp=pLI.*Pmac(nLI,sizeOfPacket,SO )+xp;
end
Ps_L=Pcon*probPortionSD*xp;
end