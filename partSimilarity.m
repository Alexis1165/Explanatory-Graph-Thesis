function [part] = partSimilarity(model,imageName,image)

% mouth parts
bndBox = parseAnnotations([imageName,'.xml']);
xMin = str2double(bndBox.mouth.xMin);
yMin = str2double(bndBox.mouth.yMin);
[mseLBP, extPosLBP,oriPosLBP] = identifyParts(model,xMin,yMin,'descend',image,false);
[mseOhneLBP, extPosOhneLBP,oriPosOhneLBP] = identifyParts(model,xMin,yMin,'descend',image,false);

if (mseLBP < mseOhneLBP)
    part.mouth.mse = mseLBP;
    part.mouth.extractedPos = extPosLBP;
    part.mouth.OriPos = oriPosLBP;
else
    part.mouth.mse = mseOhneLBP;
    part.mouth.extractedPos = extPosOhneLBP;
    part.mouth.OriPos = oriPosOhneLBP;
end

% Nose part
xMin = str2double(bndBox.nose.xMin);
yMin = str2double(bndBox.nose.yMin);
[mseLBP, extPosLBP,oriPosLBP] = identifyParts(model,xMin,yMin,'descend',image,false);
[mseOhneLBP, extPosOhneLBP,oriPosOhneLBP] = identifyParts(model,xMin,yMin,'descend',image,false);

if (mseLBP < mseOhneLBP)
    part.nose.mse = mseLBP;
    part.nose.extractedPos = extPosLBP;
    part.nose.OriPos = oriPosLBP;
else
    part.nose.mse = mseOhneLBP;
    part.nose.extractedPos = extPosOhneLBP;
    part.nose.OriPos = oriPosOhneLBP;
end


% Right eye part
xMin = str2double(bndBox.right.xMin);
yMin = str2double(bndBox.right.yMin);
[mseLBP, extPosLBP,oriPosLBP] = identifyParts(model,xMin,yMin,'descend',image,false);
[mseOhneLBP, extPosOhneLBP,oriPosOhneLBP] = identifyParts(model,xMin,yMin,'descend',image,false);

if (mseLBP < mseOhneLBP)
    part.right.mse = mseLBP;
    part.right.extractedPos = extPosLBP;
    part.right.OriPos = oriPosLBP;
else
    part.right.mse = mseOhneLBP;
    part.right.extractedPos = extPosOhneLBP;
    part.right.OriPos = oriPosOhneLBP;
end



% Left eye part
xMin = str2double(bndBox.left.xMin);
yMin = str2double(bndBox.left.yMin);
[mseLBP, extPosLBP,oriPosLBP] = identifyParts(model,xMin,yMin,'descend',image,false);
[mseOhneLBP, extPosOhneLBP,oriPosOhneLBP] = identifyParts(model,xMin,yMin,'descend',image,false);

if (mseLBP < mseOhneLBP)
    part.left.mse = mseLBP;
    part.left.extractedPos = extPosLBP;
    part.left.OriPos = oriPosLBP;
else
    part.left.mse = mseOhneLBP;
    part.left.extractedPos = extPosOhneLBP;
    part.left.OriPos = oriPosOhneLBP;
end

end

