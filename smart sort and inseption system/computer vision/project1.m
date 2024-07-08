clear all
clc
% read image 1
img1 = imread('2.jpg')
% covert image 1 to gray
image_binary1 = im2bw(img1,0.85)   %converte image to binary
figure , imshow(img1)
imtool(image_binary1)

% read image 2
img2 = imread('2.jpg')
%bw = graythresh(img)
%image_binary = im2bw(img,bw)   %converte image to binary
image_binary2 = im2bw(img2,0.85)   %converte image to binary
imshow(img2)
figure ,imshow(image_binary2)
imtool(image_binary2)
%figure , imshow(binaryImage, [])
%dim = size(image_binary)
%imshow(binaryImage(1:50,1:50))
%[L, num] = bwlabel(img)
%BW = imbinarize(image_binary , 'adaptive')
%threshold = graythresh(img)
%BW=im2bw(img,threshold)


%%%%%%%%%%%%%%%% Compare

 object = figure ,imshowpair(image_binary1,image_binary2,'diff')
 
 [r,c] = size(object)
 
 for i=1:r
     for j=1:c
         f = object(i,j)
         if f<=50
             object(i,j)= 0
             figure , imshow(img1)
             %%%%%% write text
             Text = sprintf('pass ')
             H = vision.TextInserter(Text)
             H.Color = [1.0 1.0 0]
             H.FontSize = 20
             H.Location = [25 25 25]
             I = im2double((imread('2.jpg')))
             InsertedImage = step(H, I)
             imshow(InsertedImage)
         elseif f>50
              object(i,j)= title('not pass ')
         end
     end
 end
            
             


%impixelregion()

%image_binary = not(image_binary);
%colormap([0 0 0;0.5 0.5 0.5]);

%figure, imshow(binaryImage, [])

%subplot(1,2,2)
%figure,imshow(image_binary)
%figure(1);clf
%imagesc(image_binary);colormap(gray)