I=imread('gambar1.jpeg');
figure,imshow(I)
[x y]=size(I);
for i=1:x
  for j=1:y
    if I(i,j)==0
      %break
      for jr=y:-1:1
        if I(i,jr)==0
          break
        end
        I(i,jr)=0;
      end
      break
    end
    I(i,j)=0;
  end
end
figure,imshow(I)