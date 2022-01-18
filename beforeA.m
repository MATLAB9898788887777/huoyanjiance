function A0=beforeA(K0)
[row,col]=size(K0);
S0=0;
S0=zeros();
for ii=1:row
    for jj=1:col
        if(K0(ii,jj)==1)
            S0=S0+1;
        end
    end
end
A0=S0;
end 