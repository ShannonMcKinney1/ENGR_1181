%function that allows the player to take a turn

%inputs: the scene, the ship board of the cpu, the hit miss display, and 
%the hit and miss sprites to update the hit miss scene

%outputs: a boolean returning true if it was a hit and false if it was a
%miss, and the updated hit miss display and the spu ships array

function[bool, hitmiss_display, cpu_ships] = playerTurn(my_scene, cpu_ships, hitmiss_display, hit_sprite, miss_sprite)

%get user input on where to take a shot
        [row,col,~] = getMouseInput (my_scene);
        
        %if the shot is in empty water (0)
    if(cpu_ships(row, col-11)==0)
            % Display miss for players shot at (row,col), note the +11 to 
            %shift the coordinates onto the right hand board
            hitmiss_display(row,col) = miss_sprite;
            bool=false;
            
    %if the shot was already taken in this space
    elseif(cpu_ships(row,col-11)==-1)
           
    bool=false;
    %otherwise it was a hit
    
    else
        % Display hit for player's shot at (row,col)
            hitmiss_display(row,col) = hit_sprite;
            cpu_ships(row, col-11) = 0;
            bool=true;
    end


end