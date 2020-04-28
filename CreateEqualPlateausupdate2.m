function [Tree,equalPlateausCheckImage,LocalMinima,LocalMaxima] = CreateEqualPlateausupdate2(imageLbp, conMat,image)

[I, J] = size(imageLbp);
equalPlateausCheckImage = zeros(I,J);

TreeCounter = 1;
NodeIndex = 1;

LocalMinima = [];
LocalMaxima = [];

LMaxCounter = 1;
LMinCounter = 1;

for k=1:(I*J)
    if(image(k)~=0)
        if(equalPlateausCheckImage(k)==0)
            equalPlateausCheckImage(k) = TreeCounter;
            [equalPlateausCheckImage,SubTree,NodeIndex,LocalMinimaFlag,LocalMaximaFlag] = CheckMat(equalPlateausCheckImage,k,conMat,TreeCounter,NodeIndex);
            Tree{TreeCounter,1} = SubTree;
            if(LocalMinimaFlag == 1)
                LocalMinima(LMinCounter,1) = TreeCounter;
                LMinCounter = LMinCounter + 1;
            elseif(LocalMaximaFlag == 1)
                LocalMaxima(LMaxCounter,1) = TreeCounter;
                LMaxCounter = LMaxCounter + 1;
            end
            TreeCounter = TreeCounter + 1;
            SubTree = [];
            
        else
            if(equalPlateausCheckImage(k) == 0)
                equalPlateausCheckImage(k) = TreeCounter;
                SubTree(1,:) = [NodeIndex 0 k 1];
                NodeIndex = NodeIndex + 1;
                Tree{TreeCounter,1} = SubTree;
                if(all(conMat(k,:) >= 0))
                    LocalMinima(LMinCounter,1) = TreeCounter;
                    LMinCounter = LMinCounter + 1;
                elseif(all(conMat(k,:) <= 0))
                    LocalMaxima(LMaxCounter,1) = TreeCounter;
                    LMaxCounter = LMaxCounter + 1;
                end
                TreeCounter = TreeCounter + 1;
            end
        end
    end
end

end

function [equalPlateausCheckImage , SubTree, NodeIndex,LocalMinimaFlag,LocalMaximaFlag] = CheckMat(equalPlateausCheckImage, LinIndex,conMat,TreeCounter,NodeIndex)

LocalMinimaFlag = 0;
LocalMaximaFlag = 0;
LMinCounter = 0;
LMaxCounter = 0;

[I,J] = size(equalPlateausCheckImage);
TNodeIndex = NodeIndex;

NEIGHBORS = [0,1; 1,1; 1,0; 1,-1; 0,-1; -1,-1; -1,0; -1,+1; ];

SubTree(1,:) = [NodeIndex 0 -1 1];
SubTree(2,:) = [NodeIndex+1 NodeIndex LinIndex 1];

NodeIndex = NodeIndex + 2;
SCounter = 3;

if(all(conMat(LinIndex,:) >= 0))
    LMinCounter = LMinCounter + 1;
elseif(all(conMat(LinIndex,:) <= 0))
    LMaxCounter = LMaxCounter + 1;
end
Qcount =1 ;
Queue(Qcount,1)  = LinIndex;

while(size(Queue,1) >= Qcount)
    LinInd = Queue(Qcount,1);
    
    x = floor(LinInd / I);
    
    y = mod(LinInd,I);
    
    if(y ~= 0)
        x = x + 1;
    else
        y = I;
    end
    
    arr = find(conMat(LinInd,:) == 0);
    for k = 1:size(arr,2)
        Value = [y , x] + NEIGHBORS(arr(k),:);
        if(Value(1,1) <= I &&  Value(1,2) <= J && Value(1,1)> 0 && Value(1,2)>0)
            NLinInd = (Value(1,2) -1)*I + Value(1,1);
            if(equalPlateausCheckImage(NLinInd) == 0)
                equalPlateausCheckImage(NLinInd) = TreeCounter;
                
                SubTree(SCounter,:) = [NodeIndex SubTree(1,1) NLinInd 1];
                
                NodeIndex = NodeIndex + 1;
                SCounter = SCounter + 1;
                Queue(end+1,1) = NLinInd;
                if(all(conMat(NLinInd,:) >= 0))
                    LMinCounter = LMinCounter + 1;
                elseif(all(conMat(NLinInd,:) <= 0))
                    LMaxCounter = LMaxCounter + 1;
                end
            end
        end
        
    end
    Qcount = Qcount+1;
end

if(size(SubTree,1) == 2)
    SubTree = [];
    SubTree(1,:) = [TNodeIndex 0 LinIndex 1];
    
    NodeIndex = TNodeIndex + 1;
    if(all(conMat(LinIndex,:) >= 0))
        LocalMinimaFlag = 1;
    elseif(all(conMat(LinIndex,:) <= 0))
        LocalMaximaFlag = 1;
    end
else
    if(LMinCounter == (size(SubTree,1)-1))
        LocalMinimaFlag = 1;
    elseif(LMaxCounter == (size(SubTree,1)-1))
        LocalMaximaFlag = 1;
    end
end
end