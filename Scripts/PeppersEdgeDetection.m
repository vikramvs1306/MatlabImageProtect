%Threshold value: 0.5 for averaged filter.
%Threshold value: 2.5 for Median filter.
clc 
clear all
close all
%Read the image
I = imread("peppersNoise1.tiff");
%Getting the input for threshold
prompt=("Enter threshold ");
threshold = input(prompt);
%Applying the averaged filter and median filter first 
AVI = filter2(fspecial('average',3),I)/255;
MEI = medfilt2(I,[3 3])/255;
MEId = medfilt2(I,[3 3]);
%Sobel filter for x-direction and y-direction
Sx = [-1 0 1; -2 0 2; -1 0 1];
Sy = [-1 -2 -1; 0 0 0; 1 2 1];
%Covolve the image using Sobel filters along x-direction and y-direction
X = conv2(AVI,Sx,'same');
Y = conv2(AVI,Sy,'same');
A = conv2(MEI,Sx,'same');
B = conv2(MEI,Sy,'same');
%Magnitude of the gradient
M1 = sqrt(X.*X + Y.*Y);
M2 = sqrt(A.*A + B.*B);
%Comparing the magnitude of the gradient with threshold
EdgeI = uint8((M1 > threshold)*255);
EdgeI2 = uint8((M2 > threshold)*255);
I1 = repmat(EdgeI, [1 1 3]);
I2 = repmat(EdgeI2, [1 1 3]);
%Result
figure;
montage({I,AVI,I1},"Size",[1 3]);
figure;
montage({I,MEId,I2},"Size",[1 3]);
