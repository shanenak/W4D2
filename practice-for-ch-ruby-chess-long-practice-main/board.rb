require_relative "piece_nullpiece.rb"
require_relative "piece_rook.rb"

class Board

    def initialize
        @rows = Array.new(8) {Array.new(8, nil)}
        add_pawns
        add_rooks
        # add_knights
        # add_bishops
        # add_queens
        # add_kings
        fill_empty_spaces
    end

    def [](pos)
        row, col = pos
        rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        rows[row][col] = val
    end

    def add_pawns
        i = 0
        while i < rows.length
            self[[1, i]] = Piece.new(self, :white, [1, i])
            self[[6, i]] = Piece.new(self, :black, [6, i])
            i += 1
        end

        # rows[1].each {|space| space = "hello"} # future will be from Pawn class
        # rows[6].each {|space| space = Piece.new} # future will be from Pawn class
    end

    def add_rooks
        self[[0,7]] = Rook.new(self, :white, [0,7])
        self[[0,0]] = Rook.new(self, :white, [0,0])
        self[[7,7]] = Rook.new(self, :black, [7,7])
        self[[7,0]] = Rook.new(self, :black, [7,0])
    end

    def add_knights
        self[[0, 1]] = Piece.new
        self[[0,6]] = Piece.new
        self[[7,1]] = Piece.new
        self[[7,6]] = Piece.new
    end

    def add_bishops
        self[[0, 2]] = Piece.new
        self[[0,5]] = Piece.new
        self[[7,2]] = Piece.new
        self[[7,5]] = Piece.new
    end

    def add_queens
        self[[0,3]] = Piece.new
        self[[7,3]] = Piece.new
    end

    def add_kings
        self[[0,4]] = Piece.new
        self[[7,4]] = Piece.new
    end

    def fill_empty_spaces
        rows.each_with_index do |row, row_idx|
            row.each_with_index do |col, col_idx|
                self[[row_idx, col_idx]] = NullPiece.instance if self[[row_idx, col_idx]].nil?
            end
        end
    end

    def move_piece(start_pos, end_pos)
        raise 'There is no piece in that spot' if self[start_pos].nil?
        raise "This piece can't go there" if !self[end_pos].nil? # not considering if piece was moved correctly
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end

    def valid_position?(pos)
        x, y = pos
        return false if x > 7 || x < 0
        return false if y > 7 || y < 0
        return true
    end

    def empty_space?(next_pos)
        board[next_pos]
    end

    # protected
    attr_accessor :rows
end
