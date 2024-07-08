clc
clear
close all;

% web cam function ---
% snapshot and display
%webcamlist;
%cam = webcam;
%preview(cam);
%cam.AvailableResolutions;
%cam.Resolution = '320 * 240';
%img = snapshot(cam);
%figure, imshow(img);

%

% arduino configuration -----
% a1 = arduino('com4','uno');
% a2 = -----------
%configurepin(a1,d4,'input');
%confi----------
%configurepin(a2,d3,'output');

%% -------------------

pepsi_std = imread("model 4.jpg");

figure,imshow(pepsi_std);
%h = histeq(pepsi_std);       %-----histogram equalization--------
%figure,imshow(h);
 %imtool(pepsi_std);
         
     
      %-----------------

      %  readdigitalpin(a,d4);
       % if (d4==1)
    %img = snapshot(cam);     ------- %acquire single img -----
       % end
      
    % convert rgb to greyscale ---
    greyimg = rgb2gray(pepsi_std);
    figure,imshow(greyimg);
   
    pepsi_mask = segment_pepsi(pepsi_std);
    pepsi_img = pepsi_std.*cat(3,pepsi_mask,pepsi_mask,pepsi_mask);
   % salt and noise filter
     %median = medfilt2(greyimg);
     %figure,imshow(median);

    % convert grey img to black and white ---
   % threshold = graythresh(greyimg);
    %bw = imbinarize(greyimg,threshold);
    %figure,imshow(bw);

    %can_edge = edge(bw,'sobel'); 
    %figure,imshow(can_edge);

   %laplacian filter for edging
    %f = fspecial('log');
    %cf = filter2(f,bw);
   %figure,imshow(cf/255);

    % morphological operations --------
  %   se = strel('disk',5);
   %  dilated_img = imdilate(can_edge,se);
    % filled_img = imfill(dilated_img,"holes");
     %clean_img = bwareaopen(filled_img,1000);
    %eroded_img = imerode(clean_img,se);
    % close_img = imclose(bw,se);
   %  open_img  = imopen(close_img,se);
   %  figure, imshow(open_img);
   % figure,imshow(close_img);
    %extract features ----

    %segmented_img = bsxfun(@times,pepsi_std,cast(clean_img,'like',pepsi_std));
    %figure,imshow(segmented_img);
  %  feature = regionprops (open_img,'area','BoundingBox');
  %  areas = [feature.Area];
  %  [~,index] = max (areas);
   % bbox = feature(index).BoundingBox;
    % crop the can obj;
  %  can_img = imcrop(pepsi_std,bbox);
%figure, imshow(can_img);
    % display

    % connected component analysis

 %cc = bwconncomp(eroded_img);
   %numpixels = cellfun(@numel,cc.PixelIdxList);
   %[~,idx] = max(numpixels);
    %pepsi_can = zeros(size(eroded_img));
    %pepsi_can(cc.PixelIdxList{idx})=1;

    %figure,imshow(pepsi_can);

