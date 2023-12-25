clc
close all
%Read the image
In = imread("peppersNoise1.tiff");
In2 = imread("peppersNoise2.tiff");
%Denoising images using Averaged filter with 3 x 3 pixel window size
avIn3 = filter2(fspecial('average',3),In)/255;
avIn23 = filter2(fspecial("average",3),In2)/255;
%Denoising images using Averaged filter with 5 x 5 pixel window size
avIn5 = filter2(fspecial('average',5),In)/255;
avIn25 = filter2(fspecial("average",5),In2)/255;
%Denoising images using Median filter with 3 x 3 pixel window size
MIn3 = medfilt2(In,[3 3]);
MIn23 = medfilt2(In2, [3 3]);
%Denoising images using Median filter with 5 x 5 pixel window size
MIn5 = medfilt2(In,[5 5]);
MIn25 = medfilt2(In2, [5 5]);
%Comparing the images
figure('Name','3 X 3 Averaged filter Noise1||Noise2');
montage({In,avIn3,In2,avIn23},"Size",[1 4]);
figure('Name','5 X 5 Averaged filter Noise1||Noise2');
montage({In,avIn5,In2,avIn25},"Size",[1 4]);
figure('Name','3 X 3 Median filter Noise1||Noise2');
montage({In,MIn3,In2,MIn23},"Size",[1 4]);
figure('Name','5 X 5 Median filter Noise1||Noise2');
montage({In,MIn5,In2,MIn25},"Size",[1 4]);
