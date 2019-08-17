clc;clear;
imag1=imread('F:\direction\lijuan\fastdeconv\Results\gril_noiseless\girl.tif');%original image
imag1= rgb2gray(imag1);
imag1=imag1(1:256,1:253);
imag2=imread('F:\direction\lijuan\fastdeconv\Results\gril_noiseless\softcut_Girl.tif');%good quality 
imag2= rgb2gray(imag2);


score1=psnr_mse(imag1,imag2);
