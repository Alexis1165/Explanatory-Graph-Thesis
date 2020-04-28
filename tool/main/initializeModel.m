function model=initializeModel(theConf,res)
res=roughCNN_uncompress(res,theConf);
layerNum=length(theConf.convnet_target_layers);
layer=repmat(struct('coord',[],'deform',[],'prob_record',[],'pos_record',[],'idx_record',[],'flip_record',[],'alter',[]),[1,layerNum]);
for layerID=1:2
%    oriLayer=theConf.convnet_target_layers(layerID);
    [xh,xw,channelNum]=size(res(layerID).x);
    patternNum=ceil(xh*xw*theConf.learn_pattern_density(layerID));
    deform=xh*theConf.learn_deform_init_delta;
    layer(layerID).deform=ones(patternNum,channelNum).*deform;
    layer(layerID).coord=zeros(2,patternNum,channelNum);
    for channel=1:channelNum
        tmp=randperm(xh*xw);
        tmp=tmp(1:patternNum);
        layer(layerID).coord(1,:,channel)=mod(tmp-1,xh)+1;
        layer(layerID).coord(2,:,channel)=ceil(tmp./xh);
    end
end
model.layer=layer;
end
