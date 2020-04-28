function [meanSquaredError, position, oriPos] = identifyParts(model,x,y,order,image,lbpFlag)
oriPos(1)= x;
oriPos(2)= y;

if (lbpFlag == true)
    points = extractPoints(order, model,image,false);
    
    if (size(points,1) == 0)
        points = extractPoints(order, model,image,true);
    end
    
else 
    points = extractPoints(order, model,image,true);    
end


fprintf('Size: %.2f\n', size(points,1));

position(1) = points(1,1);
position(2) = points(1,2);
meanSquaredError = rootMSE(x,y,position(1),position(2));


for i=2:size(points,1)
    fprintf('Points %.2f,%.2f\n', points(i,1),points(i,2));
    
    mse = rootMSE(x,y,points(i,1),points(i,2));
    
    fprintf('MSE %.2f\n', meanSquaredError);
    
    if (mse < meanSquaredError)
        position(1) = points(i,1);
        position(2) = points(i,2);
    end
end
end

