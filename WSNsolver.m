function WSNsolver(model,topology)
if(strcmp(topology,'star'))
    starWSNsol=starWSNsolver(model)
end
if(strcmp(topology,'tree'))
    treeWSNsol=treeWSNsolver(model)
end
if(strcmp(topology,'mesh'))
    
end
end