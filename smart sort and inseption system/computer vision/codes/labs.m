<<<<<<< HEAD
i=imread("cameraman.tif");
j=imresize(i,0.5);
k=imrotate(j,30);
cpselect(k,i);
t=cp2tform(movingPoints1,fixedPoints1,'linear');
[m n]=size(i);
recovered=imtransform(k,t,'xdata',[1 n],'ydata',[1 m]);
=======
i=imread("cameraman.tif");
j=imresize(i,0.5);
k=imrotate(j,30);
cpselect(k,i);
t=cp2tform(movingPoints1,fixedPoints1,'linear');
[m n]=size(i);
recovered=imtransform(k,t,'xdata',[1 n],'ydata',[1 m]);
>>>>>>> f4319c94dc98cdc53b162f63f125dc763aff72a9
imshow(recovered);