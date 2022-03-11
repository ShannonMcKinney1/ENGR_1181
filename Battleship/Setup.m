function [ cpu_ships ] = Setup()

% the "board" of ships is initially empty: 10 by 10 of zeros
cpu_ships = zeros(10,10);

% length of the ships, ship 1 is the carrier and has length 5, 
% ship 2 is the battleship, ship 3 is the submarine, ship 4 is the cruiser,
% and ship 5 is the PT boat
ship_length = [5,4,3,3,2];

% loop over each ship
for ship_id = 1:5
    
    % set a flag for the while loop, we will try random locations until we
    % find one that fits
    ship_placed = false;
    while ~ship_placed % continue to try and place the ship until successful
        % randomly choose between horizontal and vertical orientation by 
        % setting the horizontal flag here
        horizontal = randi([0 1]); 
        if horizontal
            % set the the row and column of the left end new ship randomly
            % it can be on any row
            row = randi([1 10]); 
            % but only on a certain range of columns depending on its
            % length
            col = randi([1 (11-ship_length(ship_id))]);
            
            % check to see if that location is empty by summing the values
            % on the board where the new ship would go, if it ends up being
            % zero, then there is room to put the new ship there
            if sum(cpu_ships(row,col:(col+ship_length(ship_id)-1))) == 0
                % if it is, fill that part of the board with the ships id
                % number
                cpu_ships(row,col:(col+ship_length(ship_id)-1)) = ship_id;
                % and set the ship_place flag to true so that we exit the
                % loop
                ship_placed = true;
            end
        else % vertical
            % if the ship is vertical, do that same thing as above, but now
            % the row and column indicate the top edge of the ship, and
            % only certain rows are allowed
            row = randi([1 (11-ship_length(ship_id))]);
            col = randi([1 10]);
            
            % this part is same as in the horizontal orientation, but for a
            % range of rows instead of a range of columns
            if sum(cpu_ships(row:(row+ship_length(ship_id)-1),col)) == 0
                cpu_ships(row:(row+ship_length(ship_id)-1),col) = ship_id;
                ship_placed = true;
            end
        end
    end
end

