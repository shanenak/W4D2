require 'byebug'
module Slideable

    HORIZONTAL_DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, -1], [1, 1]]

    def moves(direction) # chosen in piece child

        all_moves = []
        direction.each do |dir|
           next_pos = get_next_pos(pos, dir) # new possible pos
            if board.valid_position?(next_pos) 
            # if there's no piece OR if it's opponent's piece
                while board[next_pos] == NullPiece.instance || enemy_piece?(next_pos)
                    all_moves << next_pos
                    break if enemy_piece?(next_pos)
                    next_pos = get_next_pos(next_pos, dir)
                end
            end

        end
        all_moves
    end

    def get_next_pos(pos, dir)
        row = (pos[0] + dir[0])
        col = (pos[1] + dir[1])
        next_pos = [row, col] # new possible pos
    end

    def enemy_piece?(next_pos)
        board[next_pos].color != color
    end
end


module Stepable
    def moves(directions)
        # returns array of places piece can move to
    end
end

# Module::HORIZONTAL_DIRS

# horizontal_dirs