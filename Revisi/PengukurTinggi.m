clc;   
close all;  
workspace;  
fontSize = 25;
%================================ Set File Gambar =======================================

namaFile_1 = 'gambar2.jpeg';
rgbImage_1 = imread(namaFile_1);
[row, col, warna] = size(rgbImage_1);

%============================ Gambar 1 / Gambar Asli=====================================

subplot(2, 5, 1);
imshow(rgbImage_1, []);
axis on;
caption = sprintf('Gambar Asli');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0.05 1 0.95]); % mengatur lokasi gambar

%============================== Gambar 2 / Grayscale ==================================

R = rgbImage_1(:,:,1);
G = rgbImage_1(:,:,2);
B = rgbImage_1(:,:,3);
    
[M, N, ~] = size(rgbImage_1);
grayImage_1 = zeros(M, N, 'uint8');
    
for i=1:M
    for j = 1 : N
        grayImage_1(i, j) = (R(i, j) * 0.2989) + (G(i, j) * 0.5870) + (B(i, j) * 0.114);
    end
end

subplot(2, 5, 2);
imshow(grayImage_1, []);
axis on;
caption = sprintf('Gambar Gray');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0.05 1 0.95]); % mengatur lokasi gambar

%============================== Gambar 3 / Thresholding =============================

grayImage_1=double(grayImage_1);
tot=0;
[a,b]=size(grayImage_1);
tresholdImage_1=zeros(a,b);

thr=75;
disp(thr)
for i=1:a
    for j=1:b
        if grayImage_1(i,j) > thr
            tresholdImage_1(i,j)=0;
        else
            tresholdImage_1(i,j)=1;
        end
    end
end
disp(grayImage_1);
subplot(2,5,3);
imshow(tresholdImage_1, []);
axis on;
caption = sprintf('Thresholding');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');

%============================== Gambar 4 / BoundingBox ==============================

ab_1 = tresholdImage_1 > 0;
ab_1 = bwareafilt(ab_1, 1);

% Get the bounding box of the blob.
props = regionprops(ab_1, 'BoundingBox');
boundingBox = [props.BoundingBox]


nPixelPutih = sum(sum(ab_1==1));
disp(nPixelPutih);
nPixelHitam = sum(sum(ab_1==0));
disp(nPixelHitam);

% Display the original image.
subplot(2, 5, 4);
imshow(rgbImage_1, []);
axis on;
caption = sprintf('Bounding Box');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
% Plot the bounding box over it.
hold on;
rectangle('Position', boundingBox, 'LineWidth', 2, 'EdgeColor', 'r')

%================ Cek Tinggi pixel Bounding Box===================

subplot(2,5,5);
hasil_1 =imcrop(rgbImage_1,boundingBox);
imshow(hasil_1, []);
axis on;
caption = sprintf('Hasil Crop');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
tinggi_1 = size(hasil_1,1);
hold on;

%#################################### Gambar 2 ##########################################

%================================ Set File Gambar =======================================

namaFile_2 = 'gambar1.jpeg';
rgbImage_2 = imread(namaFile_2);
[row, col, warna] = size(rgbImage_2);

%============================ Gambar 1 / Gambar Asli=====================================

subplot(2, 5, 6);
imshow(rgbImage_2, []);
axis on;
caption = sprintf('Gambar Asli');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0.05 1 0.95]); % mengatur lokasi gambar

%============================== Gambar 2 / Grayscale ==================================


R = rgbImage_2(:,:,1);
G = rgbImage_2(:,:,2);
B = rgbImage_2(:,:,3);
    
[M, N, ~] = size(rgbImage_2);
grayImage_2 = zeros(M, N, 'uint8');
    
for i=1:M
    for j = 1 : N
        grayImage_2(i, j) = (R(i, j) * 0.2989) + (G(i, j) * 0.5870) + (B(i, j) * 0.114);
    end
end

subplot(2, 5, 7);
imshow(grayImage_2, []);
axis on;
caption = sprintf('Gambar Gray');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0.05 1 0.95]); % mengatur lokasi gambar

%============================== Gambar 3 / Thresholding =============================

grayImage_2=double(grayImage_2);
tot=0;
[a,b]=size(grayImage_2);
tresholdImage_2=zeros(a,b);

thr=60;
for i=1:a
    for j=1:b
        if grayImage_2(i,j) > thr
            tresholdImage_2(i,j)=0;
        else
            tresholdImage_2(i,j)=1;
        end
    end
end

subplot(2,5,8);
imshow(tresholdImage_2, []);
axis on;
caption = sprintf('Thresholding');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');

%============================== Gambar 4 / BoundingBox ==============================

ab_2 = tresholdImage_2 > 0;
ab_2 = bwareafilt(ab_2, 1);

% Get the bounding box of the blob.
props = regionprops(ab_2, 'BoundingBox');
boundingBox = [props.BoundingBox]


nPixelPutih = sum(sum(ab_2==1));
disp(nPixelPutih);
nPixelHitam = sum(sum(ab_2==0));
disp(nPixelHitam);

% Display the original image.
subplot(2, 5, 9);
imshow(rgbImage_2, []);
axis on;
caption = sprintf('Bounding Box');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
% Plot the bounding box over it.
hold on;
rectangle('Position', boundingBox, 'LineWidth', 2, 'EdgeColor', 'r')

%================ Cek Tinggi pixel Bounding Box===================

subplot(2,5,10);
hasil_2 =imcrop(rgbImage_2,boundingBox);
imshow(hasil_2, []);
axis on;
caption = sprintf('Hasil Crop');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
tinggi_2 = size(hasil_2,1);
disp(tinggi_2);
hold on;

sup = suptitle('Pengukuran Tinggi Suatu Benda');
set(sup,'FontSize',30)

%================ Penerapan Rumus ===================
aTs = 10; %Asumsi
aPx = double(tinggi_1);
bPx = double(tinggi_2);

bTs = int32((aTs/aPx) * bPx);
fprintf('%s yang diambil dari gambar 1 adalah %d \n','Tinggi pixel (aPx) ',aPx);
fprintf('%s yang diambil dari gambar 2 adalah %d \n','Tinggi pixel (bPx)',bPx);
fprintf('%s dari gambar 1 adalah %d \n','Asumsi tinggi sebenarnya (aTs) ',aTs);
fprintf('%s dari gambar 2 adalah %d \n','Sehingga tinggi sebenarnya (bTs) ',bTs);