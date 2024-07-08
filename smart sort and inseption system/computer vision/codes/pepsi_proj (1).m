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


% arduino configuration -----
% a1 = arduino('com4','uno');
% a2 = -----------
%configurepin(a1,d4,'input');
%confi----------
%configurepin(a2,d3,'output');

%% -------------------

pepsi_std = imread("pepsi_PNG5.png");
figure,imshow(pepsi_std);
%h = histeq(pepsi_std);       -----histogram equalization--------
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

    %laplacian filter for edging
   % f = fspecial('log');
   % cf = filter2(f,bw);
   % figure,imshow(cf/255);

   % salt and noise filter
     median =medfilt2(greyimg);
     figure,imshow(median);

    % convert grey img to black and white ---
    bw = imbinarize(greyimg,0.5);
    figure,imshow(bw);
     
    %extract features ----
    [l , n] = bwlabel(bw);
    feature = regionprops (l,'all');
    info = imfinfo('pepsi_PNG5.png');
    reald = 6.62 ;
    realh = 12.2 ;
    %}