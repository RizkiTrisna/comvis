clc;   
close all;  
workspace;  
fontSize = 25;
%================================ Set File Gambar =======================================

namaFile = 'bunga3.jpg';
rgbImage = imread(namaFile);
[row, col, warna] = size(rgbImage);

%============================ Gambar 1 / Gambar Asli=====================================

subplot(1, 4, 1);
imshow(rgbImage, []);
axis on;
caption = sprintf('Gambar Asli');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0.05 1 0.95]);

%============================== Gambar 2 / Grayscale ==================================

[row, col, warna] = size(rgbImage)
if warna > 1
  grayImage = rgb2gray(rgbImage);
end
% Display the image.
subplot(1, 4, 2);
imshow(grayImage, []);
axis on;
caption = sprintf('Gray');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');

%============================== Gambar 3 / Thresholding =============================

grayImage=double(grayImage);
tot=0;
[a,b]=size(grayImage);
treshold=zeros(a,b);
for i=1:a
    for j=1:b
            treshold(i,j)=0;
        end
end
for i=1:a
    for j=1:b
        tot=tot+grayImage(i,j);
    end
end
thr=tot/(a*b);
for i=1:a
    for j=1:b
        if grayImage(i,j) > thr
            treshold(i,j)=0;
        else
            treshold(i,j)=1;
        end
    end
end

subplot(1,4,3);
imshow(treshold, []);
axis on;
caption = sprintf('Thresholding');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
hp = impixelinfo();

%============================== Gambar 4 / BoundingBox ==============================

ab = treshold > 0;
ab = bwareafilt(ab, 1);

% Get the bounding box of the blob.
props = regionprops(ab, 'BoundingBox');
boundingBox = [props.BoundingBox]

%================ Cek Jumlah pixel hitam dan putih ===================
nPixelPutih = sum(sum(ab==1));
disp(nPixelPutih);
nPixelHitam = sum(sum(ab==0));
disp(nPixelHitam);

% Display the original image.
subplot(1, 4, 4);
imshow(rgbImage, []);
axis on;
caption = sprintf('Bounding Box');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
% Plot the bounding box over it.
hold on;
rectangle('Position', boundingBox, 'LineWidth', 2, 'EdgeColor', 'r')

