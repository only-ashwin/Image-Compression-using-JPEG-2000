clear all;
close all;
X = imread("cameraman.tif");
n=input('Enter the decomposition level');
wname = input('Enter the name of the wavelet');
x = double(X);
NbColors = 255;
map = gray(NbColors);
x = uint8(x);

[c,s] = wavedec2(x,n,wname);

alpha = 1.5; m = 2.7*prod(s(1,:));
[thr,nkeep] = wdcbm2(c,s,alpha,m);

[xd,cxd,sxd,perf0,perf12] = wdencmp('lvd',c,s,wname,n,thr,'h');
disp('Compression Ratio');
disp(perf0);

subplot(221), image(x);
colormap(map);
title('Original image')
subplot(222), image(xd);
colormap(map);
title('Compressed image');

disp('Original Image');

disp('Compressed Image');
