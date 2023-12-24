
clc
clear all
close all
%Read the image
pout = imread("pout.tif");
%Get the input for the Gamma value
prompt = ("Enter Gamma value ");
gamma = input(prompt);
%Transformation function
u = 0:255;
v = 255*(u/255).^gamma;
%Plotting the graph 
figure; plot(u,v); title('gamma correction');
%Implementing the transform function
imcorrected = v(pout);
%Convert the image to 8-bit integer format
imcorrected = uint8(imcorrected);
%Plot the pixel histogram to see the difference
figure; 
subplot(2,1,1); imhist(pout); title('histogram original');
subplot(2,1,2); imhist(imcorrected); title('histogram imcorrected');
%Compare the images before and after contrast enhancement
figure;
montage({pout,imcorrected},"Size",[1 2]);
%Gamma value: 1.9
