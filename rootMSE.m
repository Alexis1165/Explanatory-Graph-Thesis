function [meanSquaredError] = rootMSE(x1,y1,x2,y2)
    meanSquaredError = sqrt((x1-x2)^2 + (y1-y2)^2);
end

