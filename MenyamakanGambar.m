clc;
a = imread('Revisi\bunga3.jpg');
b = imread('Revisi\bunga3.jpg');

a = a - mean2(a);
b = b - mean2(b);
r = sum(sum(a.*b))/sqrt(sum(sum(a.*a))*sum(sum(b.*b)));
