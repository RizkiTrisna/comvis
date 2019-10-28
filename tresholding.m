x = imread('bunga.jpg   ')>100;
bb = regionprops(x,'BoundingBox')
bbMatrix = vertcat(bb(:).BoundingBox)
bbMatrix(:,3);%height
figure,imshow(bbMatrix);
