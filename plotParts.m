function [mouthMSE, noseMSE, rightMSE, leftMSE,mouthPos,oriMouth] = plotParts(parts)
%     load('PartData/parts.mat','parts');
    mouthSum = 0;
    noseSum = 0;
    rightSum = 0;
    leftSum = 0;
    
    for i=1:20
        mouthPos(i,:) = parts(i).mouth.extractedPos;         
        oriMouth(i,:) = parts(i).mouth.OriPos;
        nosePos(i,:) = parts(i).nose.extractedPos; 
        oriNose(i,:) = parts(i).nose.OriPos;
        rightPos(i,:) = parts(i).right.extractedPos; 
        oriRight(i,:) = parts(i).right.OriPos;
        leftPos(i,:) = parts(i).left.extractedPos; 
        oriLeft(i,:) = parts(i).left.OriPos;        
        
        mouthSum = mouthSum + parts(i).mouth.mse;         
        noseSum = noseSum + parts(i).nose.mse;         
        rightSum = rightSum + parts(i).right.mse;         
        leftSum = leftSum + parts(i).left.mse;         
    end
    
    mouthMSE = mouthSum/20;
    noseMSE = noseSum/20;
    rightMSE = rightSum/20;    
    leftMSE = leftSum/20;

    
    plot([mouthPos;oriMouth]);
    saveas(gcf,'GraphOutput/Mouth/mouthPos.png')
%     plot(oriMouth(:));
%     saveas(gcf,'GraphOutput/Mouth/oriMouth.png')
    
    plot([nosePos;oriNose]);
    saveas(gcf,'GraphOutput/Nose/nosePos.png')
%     plot(oriNose(:));
%     saveas(gcf,'GraphOutput/Nose/oriNose.png')

    plot([rightPos;oriRight]);
    saveas(gcf,'GraphOutput/RightEye/rightPos.png')
%     plot(oriRight(:));
%     saveas(gcf,'GraphOutput/RightEye/oriRight.png')

    plot([leftPos;oriLeft]);
    saveas(gcf,'GraphOutput/LeftEye/leftPos.png')
%     plot(oriLeft(:));
%     saveas(gcf,'GraphOutput/LeftEye/oriLeft.png')
    
end

