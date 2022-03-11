%checks if there are still ships left on the board that have not been sunk

%inputs: the ships array board

%outputs: a boolean variable if this board has ships (false) or if all the
%ships have been sunk(true)

function [bool] = checkWinner(ships)
bool = true;

%traverses through the entire array
for x=1:10

    for y=1:10
       
        %if a ship is found, then there isn't a winner, return false
        if((ships(x, y) >0))
          
            bool = false;
            break;
        
        end
        
        
    end
end



end