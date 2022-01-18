function A=nowA(K)
[row,col]=size(K);
S=0;
S=zeros();
for ii=1:row
    for jj=1:col
        if(K(ii,jj)==1)
            S=S+1;
        end
    end
end
A=S;
end 