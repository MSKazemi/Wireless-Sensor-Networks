function euclideanDistance = euclideanDis(point1,point2)
if (size(point1,2)==2)
euclideanDistance=sqrt((point1(1,1)-point2(1,1)).^2 + (point1(1,2)-point2(1,2)).^2);
else if(size(point1,2)==3)
euclideanDistance=sqrt((point1(1,1)-(point2(1,1)).^2+(point1(1,2)-(point2(1,2)).^2+(point1(1,3)-point2(1,3)).^2)));
    end
    
end
end

