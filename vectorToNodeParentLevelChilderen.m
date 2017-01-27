function nodeParentLevelChilderen=vectorToNodeParentLevelChilderen(treeVector)
nodeParentLevelChilderen(1,:)=[1,0,0];
for i=2:size(treeVector,2)
    nodeParentLevelChilderen(i,1)=i; %node
    nodeParentLevelChilderen(i,2)=treeVector(1,i); %parent
    nodeParentLevelChilderen(i,3)=NaN; %Level of Node
    nodeParentLevelChilderen(i,4)=NaN; % Numbers of Childeren
end
for j=2:size(treeVector,2)
  nodeParentLevelChilderen(j,3)=nodeParentLevelChilderen(treeVector(1,j),3)+1;
end
for i=1:size(treeVector,2) 
    nodeParentLevelChilderen(i,4)=size(find(nodeParentLevelChilderen(:,2)==i),1);
end

disp('Following tree has following specification:');
disp(treeVector);
disp('Node Name Parent Level Childeren');
disp(nodeParentLevelChilderen);
end