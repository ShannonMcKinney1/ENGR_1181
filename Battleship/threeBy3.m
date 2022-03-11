%the user selects the top left corner of the 3x3 square and that area is
%revealed

%assumes the entire square is within the bounds

%inputs:the spu_ships array, the scene, the hitmiss display that will be
%updated with the hit and miss sprites

%outputs: the updated cpu_ships array and hitmiss_display

function[cpu_ships, hitmiss_display]= threeBy3(cpu_ships, my_scene, hitmiss_display, hit_sprite, miss_sprite) 

row = 0;
col=0;


while(row+2>10)||(row<1)||(col-9>10)||(col-11<1)
    %get top left corner from user
    [row,col,~] = getMouseInput (my_scene);
end

    for x=row:row+2
        for y=col:col+2
            if(cpu_ships(x,y-11)>0)
            %Display hit for player's shot at (row,col)
            hitmiss_display(x,y) = hit_sprite;
            cpu_ships(x, y-11) = 0;
            
            elseif((cpu_ships(x,y-11)==0))
                hitmiss_display(x,y) = miss_sprite;
            end
        end
    end
end
