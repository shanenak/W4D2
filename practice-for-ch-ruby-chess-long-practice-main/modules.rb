module Slideable

    HORIZONTAL_DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, -1], [1, 1]]

    def moves(direction) # chosen in piece child

        all_moves = []

        direction.each do |dir|
           row = (pos[0] + dir[0])
           col = (pos[1] + dir[1])
           next_pos = [row, col] # new possible pos

           # if there's no piece OR if it's opponent's piece
            while board[next_pos] == NullPiece || board[next_pos].color != color
                all_moves << next_pos
                break if board[next_pos].color != color

                row = (pos[0] + dir[0])
                col = (pos[1] + dir[1])
                next_pos = [row, col] # new possible pos
            end

        end

        all_moves
    end
end


module Stepable
    def moves(directions)
        # returns array of places piece can move to
    end
end
