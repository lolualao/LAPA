row = 20;
column =20;
V = zeros(row,column);
V(:,1) = 1;
V(:,column) = 1;

[X,Y] = meshgrid(1:20,1:20);

for n = 1:30
    figure(1)
    surf(X,Y,V)
    pause(0.2)
    for c = 2: column-1
        for r  = 1: row
            if r == 1
                %V(r,c) = (V(r+1,c)+V(r,c+1)+V(r,c-1))/3;
                V(r,c) = 0;
            elseif r == row
                %V(r,c) = (V(r-1,c)+V(r,c+1)+V(r,c-1))/3;
                    V(r,c) = 0;
            else
                V(r,c) = (V(r-1,c)+V(r+1,c)+V(r,c+1)+V(r,c-1))/4;
               
            %V(1,:) = V(2,:)
            %V(row,:) = V(row-1,:)
            
            end
        end
        
    end
   Vnew = imboxfilt(V,3);


end

 figure(2)
    [DX,DY] = gradient(V,1,1);
    quiver(X,Y,DX,DY)
    %imboxfilt(V,3)
    
figure (3)
 surf(X,Y,Vnew)
