function cnt=Harrris(itedge,a)
I=double(itedge);
fx=[5,0,-5;8,0,-8;5,0,-5];
fx=[-2,-1,0,1,2];
Ix=filter2(fx,I);
fy=[5,0,-5;8,0,-8;5,0,-5];
fy=[-2;-1;0;1;2];
Iy=filter2(fy,I);
Ix2=Ix.^2;
Iy2=Iy.^2;
Ixy=Ix.*Iy;
h=fspecial('gaussian',[7,7],2);
Ix2=filter2(h,Ix2);
Iy2=filter2(h,Iy2);
Ixy=filter2(h,Ixy);
[height,width]=size(I);
R=zeros(height,width);
for i=1:height
    for j=1:width
        M=[Ix2(i,j) Ixy(i,j);Ixy(i,j) Iy2(i,j)];
        R(i,j)=det(M)-a*(trace(M))^2;
    end
end
Rmax=max(max(R));
t=0.01*Rmax;
for i=1:height
    for j=1:width
        if R(i,j)<t
            R(i,j)=0;
        end
    end
end
corner_peaks=imregionalmax(R);
cnt=sum(sum(corner_peaks));
% [posr,posc]=find(corner_peaks==1);
% figure(11)
% imshow(in_image);
%  hold on
%  for i=1:length(posr)
%     plot(posc,posr,'r+');
%  end
end