function pHW=x2p_(xHW,layer,theConf)
if(isfield(theConf,'convnet'))
    Stride=theConf.convnet_target_stride(layer);
    centerStart=theConf.convnet_target_center(layer);
else
    Stride=theConf.convnet_target_stride(layer);
    centerStart=theConf.convnet_target_center(layer);
end
pHW=centerStart+(xHW-1).*Stride;
end
