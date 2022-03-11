%This function determines if the shot was a hit or miss and updates the
%arrays and scene accordingly

%inputs: the ships array board, the hitmiss dipay board for the scene, the
%row and column of the shot, the hit and miss sprtes to updat ethe scene

%outputs: a boolean variable of if the shot was a hit or miss, the updated
%hit miss display and the updated ships array


function[bool, hitmiss_display, ships] = hitOrMiss(ships, hitmiss_display, row, col, hit_sprite, miss_sprite)


    if(ships(row, col)==0)
            % Display miss for players shot at (row,col), note the +11 to 
            %shift the coordinates onto the right hand board
            hitmiss_display(row,col) = miss_sprite;
            bool=false;
            
    %if a shot was already taken here
    elseif(ships(row,col)==-1)
            
            bool = false;
            
            
    else
        % Display hit for player's shot at (row,col)
            hitmiss_display(row,col) = hit_sprite;
            bool=true;
    end

    ships(row, col) = -1;

end