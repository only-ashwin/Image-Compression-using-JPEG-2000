close all
clear all
x=imread('pepper (1).jpg');
figure,imshow(x);
F=dct2(x);
figure,imshow(F*0.01);
ff = idct2(F);
figure,imshow(ff/255);

[r,c] = size(x);
DF = zeros(r,c);
DFF = DF;
IDF = DF;
IDFF = DF;
depth = 4;
N = 8;

for i = 1 : N : r
    for j = 1 : N : c
        f = x(i:i+N-1,j:j+N-1);
        df = dct2(f);
        DF(i:i+N-1,j:j+N-1) = df;
        dff = idct2(df);
        DFF(i:i+N-1,j:j+N-1) = dff;

        df(N:-1:depth+1,:) = 0;
        df(:,N:-1:depth+1) = 0;
        IDF(i:i+N-1,j:j+N-1) = df;
        dff = idct2(df);
        IDFF(i:i+N-1,j:j+N-1) = dff;
    end
end

figure,imshow(DF/255);
figure,imshow(DFF);
A=DFF/255;
figure,imshow(A)
imwrite(A,'abc1.tif');

B=IDFF/255;
imwrite(B,'abc2.tif');
figure,imshow(B)