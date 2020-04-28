function boundingBox = parseAnnotations(fileName)    
    xmlFile = ['D:\Thesis\MatlabDirectory\Working Code\explanatoryGraph-master\code\part_data\Annotations\',fileName];    
    node = parseXML(xmlFile);
    boundingBox.right.xMin = node.Children(14).Children(10).Children(2).Children.Data;
    boundingBox.right.yMin = node.Children(14).Children(10).Children(4).Children.Data;  
    boundingBox.right.xMax = node.Children(14).Children(10).Children(6).Children.Data;
    boundingBox.right.yMax = node.Children(14).Children(10).Children(8).Children.Data;
    
    boundingBox.left.xMin = node.Children(16).Children(10).Children(2).Children.Data;
    boundingBox.left.yMin = node.Children(16).Children(10).Children(4).Children.Data;
    boundingBox.left.xMax = node.Children(16).Children(10).Children(6).Children.Data;
    boundingBox.left.yMax = node.Children(16).Children(10).Children(8).Children.Data;
    
    boundingBox.nose.xMin = node.Children(18).Children(10).Children(2).Children.Data;  
    boundingBox.nose.yMin = node.Children(18).Children(10).Children(4).Children.Data;  
    boundingBox.nose.xMax = node.Children(18).Children(10).Children(6).Children.Data;  
    boundingBox.nose.yMax = node.Children(18).Children(10).Children(8).Children.Data;  
    
    boundingBox.mouth.xMin = node.Children(20).Children(10).Children(2).Children.Data;     
    boundingBox.mouth.yMin = node.Children(20).Children(10).Children(4).Children.Data;     
    boundingBox.mouth.xMax = node.Children(20).Children(10).Children(6).Children.Data;     
    boundingBox.mouth.yMax = node.Children(20).Children(10).Children(8).Children.Data;     
    
end