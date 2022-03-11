% This is a power-up function. The player will get two turns instead of 
% one.

%inputs: the scene, the ship board of the cpu, the hit miss display, and 
%the hit and miss sprites to update the hit miss scene, and the ships array
%and board display to update the board in between hits

%outputs: updated ships array and updated hitmiss_display

function [cpu_ships, hitmiss_display] = twoTurns( my_scene, cpu_ships, hitmiss_display, hit_sprite, miss_sprite, board_display)

    for x = 1:2
        %calls player turn twice
        [~, hitmiss_display, cpu_ships] = playerTurn(my_scene, cpu_ships, hitmiss_display, hit_sprite, miss_sprite);
        drawScene(my_scene,board_display,hitmiss_display)
    end

end
