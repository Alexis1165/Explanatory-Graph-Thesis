function [positions] = extractPoints(order,model,image,flag)
layerList=[1,2];
topPatchNum_forRank=50;
topPatternNum=40;
topPatchNum_show=5;
currentPatch=[];
counter = 1;
positions=[];
lc=0;

addpath(genpath('./tool'));
I = rgb2gray(image);
I = imresize(I,[150,150]);
[imageLbp,conMat] = lbp(I);

for layerID=layerList
    lc=lc+1;
    prob=model.layer(layerID).prob_record;
    tmp=sort(prob,2,order);
    tmp=sum(tmp(:,1:topPatchNum_forRank),2);
    [~,idx_m]=sort(tmp,'descend');
    for c=1:topPatternNum
        p=idx_m(c);
        [~,idx]=sort(prob(p,:),order);
        for i=1:topPatchNum_show
            imgID=idx(i);
            pos=model.layer(layerID).pos_record(:,p,imgID);
            roundP1 = round(pos(1));
            roundP2 = round(pos(2));
            
            if (flag == false)
                if (imageLbp(roundP1,roundP2) < 255)
                    positions(counter,1) = pos(1);
                    positions(counter,2) = pos(2);
                    counter = counter + 1;
                end
                
            else
                    positions(counter,1) = pos(1);
                    positions(counter,2) = pos(2);
                    counter = counter + 1;                
            end
        end
    end
end
end

