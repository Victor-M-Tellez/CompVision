function [shrunken] = ObjShrinkingFilter(Canvas,shrinkerThreshold,shrinkerStrength)

shrunken = ObjShrinker(Canvas, shrinkerThreshold);
for j=1:shrinkerStrength
	shrunken = ObjShrinker(shrunken, shrinkerThreshold);
end

imwrite(shrunken,'Zebra6_Shrink.tif','tiff');




