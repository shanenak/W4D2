require_relative "piece.rb"

class Board

    def initialize
        @rows = Array.new(8) {Array.new(8, nil)}
        add_pawns
        add_rooks
        add_knights
        add_bishops
        add_queens
        add_kings
        puts rows
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
            self[[1, i]] = Piece.new
            self[[6, i]] = Piece.new 
            i += 1
        end
        
        # rows[1].each {|space| space = "hello"} # future will be from Pawn class
        # rows[6].each {|space| space = Piece.new} # future will be from Pawn class
    end

    def add_rooks
        self[[0,7]] = Piece.new # will be rook
        self[[0,0]] = Piece.new # will be rook
        self[[7,7]] = Piece.new # will be rook
        self[[7,0]] = Piece.new # will be rook
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

    # def fill_empty_spaces
    #     rows.each do |row|
    #         row.each {|spot| spot = }
        # end
    # end

    def move_piece(start_pos, end_pos)
        raise 'There is no piece in that spot' if self[start_pos].nil?
        raise "This piece can't go there" if !self[end_pos].nil? # not considering if piece was moved correctly
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end

    # protected
    attr_reader :rows
end
