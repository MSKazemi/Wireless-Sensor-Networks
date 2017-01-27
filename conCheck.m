function connected = conCheck(Pt,Psens,Gt,Gr,Beta,f,dis)
% Psens --> Coordinator
% Pt --> Node 1 
% dis = Node 1 <---> Coordinator
maxRadioTxDistance = maxTxDis(Pt,Psens,Gt,Gr,Beta,f);
if(maxRadioTxDistance>=dis)
    connected=1;
else
    connected=0;
end
end