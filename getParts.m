function [parts] = getParts(netName)

% conf = readJson([netName,'/conf.json']);
% images = readJson([netName,'/images.json']);
load([netName,'/model.mat'],'model');
directory = dir('PartData/LabelledImages');

for i=3:22
    imageName = strrep(directory(i).name,'.jpg','');
    image = imread(strcat(directory(i).folder,'\',directory(i).name));
    fprintf('Processing Image %s\n', imageName);
    part = partSimilarity(model,imageName,image);
    part.name = imageName;
    parts(i-2) = part;
end


end

