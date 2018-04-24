function [expanded] = ObjExpandFilter(Canvas,expanderThreshold,expanderStrength)

expanded = ObjExpander(Canvas,expanderThreshold);
for j=1:expanderStrength
	expanded = ObjExpander(expanded,expanderThreshold);
end

imwrite(expanded,'Zebra5_Expansion.tif','tiff');
