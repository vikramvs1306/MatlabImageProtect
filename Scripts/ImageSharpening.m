clc
close all
%Reading the image
shar = imread("moon.tiff");
%Defining the laplace filter
lap = [0 -0.25 0; -0.25 1 -0.25; 0 -0.25 0];
%Getting the value of scaling constant
prompt = ("Enter the scaling constant ");
const = input(prompt);
%Convolve the image "shar" using laplacian mask
c = conv2(shar,lap,"same");
%Scaling
scale = (const*c);
%Converting the image to 8-bit integer format
n1 = uint8(scale);
%Adding back to the original image to get the sharpened image
a = shar+n1 ;
%Compare the images
figure;
montage({shar,abs(a)},"Size",[1 2]);
%Scaling constant: 3.8 for moon image
%Scaling constant: 28 for outoffocus image

