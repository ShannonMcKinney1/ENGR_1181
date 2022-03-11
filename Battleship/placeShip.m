%function that allows the player to manually place their ships
%does not ensure the size or orientation of the ships (the user must enter
%coordinates correctly

%does ensure that there will only be five ships placed

%input: the board display for the scene, and the scene

%output: the player array board with the ships in it, and the updated board
%and scene displays

function[player_ships, board_display, my_scene] = placeShip(board_display, my_scene)

%initializing the sprites for the ships for the display
left_ship_sprite = 3;
horiz_ship_sprite = 4;
right_ship_sprite = 5;
top_ship_sprite = 6;
vert_ship_sprite = 7;
bot_ship_sprite = 8;

% the "board" of ships is initially empty: 10 by 10 of zeros
player_ships = zeros(10,10);

%variable for the ship count
ships = 0;

%while the player hasn't placed five ships
while(ships < 5)

    %get two coordinate inputs from the user
    [row1,col1,~] = getMouseInput (my_scene);
    [row,col,~] = getMouseInput (my_scene);
    
    %if teh user is placing a ship horizontally
    if(row1 == row)
        %Place the left pointing end of the ship 
        board_display(row1,col1) = left_ship_sprite;
        player_ships(row1, col1) = 1;

        %if the user is 
        if(((col+1)-(col1-1))>0)
            for i= col1+1:col-1
            % Place the middle sections of the ship 
                board_display(row,i) = horiz_ship_sprite;
                player_ships(row, i) = 1;

            end
        end

    %Place the right pointing end of the ship 
    board_display(row,col) = right_ship_sprite;
    player_ships(row, col) = 1;

    else
    % Place the left pointing end of the ship 
    board_display(row1,col1) = top_ship_sprite;
    player_ships(row1, col1) = 1; 

        if(((row+1)-(row1-1))>2)
            for i= row1+1:row-1
                % Place the middle sections of the ship 
                board_display(i,col) = vert_ship_sprite;
                player_ships(i, col) = 1; 

            end
        end

        % Place the right pointing end of the ship 
        board_display(row,col) = bot_ship_sprite;
        player_ships(row, col) = 1; 

    end

drawScene(my_scene,board_display)
ships = ships+1;

end
end
