function res=roughCNN_uncompress(res_c,theConf)
%IsUseUInt8=true;

num=length(res_c);
res=repmat(struct('x',[],'dzdx',[],'dzdw',[],'aux',[],'stats',[],'time',0,'backwardTime',0),[1,num]);

theSize=res_c(1).size;
theSize=theSize(:)';
RC=res_c(1);
x=(single(RC.x).*repmat(single(RC.range_x),[theSize(1),theSize(2),1]))./255.0;
x=x+repmat(single(RC.min_x),[theSize(1),theSize(2),1]);
res(1).x=reshape(x,theSize);

theSize=res_c(2).size;
theSize=theSize(:)';
RC=res_c(2);
x=(single(RC.x).*repmat(single(RC.range_x),[theSize(1),theSize(2),1]))./255.0;
x=x+repmat(single(RC.min_x),[theSize(1),theSize(2),1]);
res(2).x=reshape(x,theSize);

end
