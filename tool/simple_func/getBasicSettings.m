function [posCand,map_delta,halfRange]=getBasicSettings(x,theConf,deform_delta,layerID)
deform_delta=deform_delta(:);
[xh,xw,~]=size(x);
posCandNum=min([theConf.learn_position_cand_num,xh,xw]);
map_delta=theConf.learn_map_delta*xh;
halfRange=round(min(theConf.learn_search_max_range(layerID)*xh/2,deform_delta.*theConf.learn_search_deform_ratio));
num=numel(deform_delta);
posCand=zeros(posCandNum,num);
for i=1:num
    tmp=linspace(-halfRange(i),halfRange(i),posCandNum+1);
    posCand(:,i)=(tmp(1:end-1)+tmp(2:end))./2;
end
end
