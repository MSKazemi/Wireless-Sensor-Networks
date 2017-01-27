function HTPCheck = HTPCheck(Pt,Psens,Gt,Gr,Beta,f,dis)
% Psens --> Node 1
% Pt --> Node 2 
% dis = Node 1 <---> Node 2
maxRadioTxDistance = maxTxDis(Pt,Psens,Gt,Gr,Beta,f);
if(maxRadioTxDistance>=dis)
    HTPCheck=0; % No HTP
else
    HTPCheck=1; % Have HTP 
end
end