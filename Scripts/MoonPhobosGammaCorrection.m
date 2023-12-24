%Gamma value: 0.4
clc
clear all
close all
%Read the image
MP = imread("MoonPhobos.tif");
%Get the input for the Gamma value
prompt = ("Enter Gamma value ");
gamma = input(prompt);
%Transformation function
u = 0:255;
v = 255*(u/255).^gamma;
%Plotting the graph 
figure; plot(u,v); title('gamma correction');
%Implementing the transform function
imcorrected = v(MP+1);
%Convert the image to 8-bit integer format
imcorrected = uint8(imcorrected);
%Histogram equalization
HE = histeq(MP);
%Plot the pixel histogram to see the difference
figure; 
subplot(3,1,1); imhist(MP); title('histogram original');
subplot(3,1,2); imhist(imcorrected); title('histogram imcorrected');
subplot(3,1,3); imhist(HE); title("HIstogram equalization");
%Compare the images before and after contrast enhancement
figure;
montage({MP,imcorrected,HE},"Size",[1 3]);
