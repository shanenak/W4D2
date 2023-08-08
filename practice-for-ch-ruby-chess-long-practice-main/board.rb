class Board 

    def initialize
        @rows = Array.new(8) {Array.new(8, nil)}
        add_pawns
        add_rooks
        add_knights
        add_bishops
        add_queens
        add_kings
    end

    def add_pawns
        rows[2].each {|space| space = Piece.new} # future will be from Pawn class
        rows[6].each {|space| space = Piece.new} # future will be from Pawn class
    end

    def add_rooks
        rows[[0, 7]] = Piece.new # will be rook
        rows[[0,0]] = Piece.new # will be rook
        rows[[7,7]] = Piece.new # will be rook
        rows[[7,0]] = Piece.new # will be rook
    end

    def add_knights
        rows[[0, 1]] = Piece.new 
        rows[[0,6]] = Piece.new 
        rows[[7,1]] = Piece.new 
        rows[[7,6]] = Piece.new 
    end

    def add_bishops
        rows[[0, 2]] = Piece.new 
        rows[[0,5]] = Piece.new 
        rows[[7,2]] = Piece.new 
        rows[[7,5]] = Piece.new 
    end

    def add_queens
        rows[[0,3]] = Piece.new 
        rows[[7,3]] = Piece.new 
    end

    def add_kings
        rows[[0,4]] = Piece.new 
        rows[[7,4]] = Piece.new 
    end

    # def fill_empty_spaces
    #     rows.each do |row|
    #         row.each {|spot| spot = }
        # end
    # end

    def [](pos)
        row, col = pos 
        @rows[row][col]
    end
    def []=(pos, val)
        row, col = pos 
        @rows[row][col] = val
    end
    def move_piece(start_pos, end_pos)
        raise 'There is no piece in that spot' if rows[start_pos].nil?
        raise "This piece can't go there" if !rows[end_pos].nil? # not considering if piece was moved correctly
        rows[end_pos] = rows[start_pos]
        rows[start_pos] = nil
    end

    protected
    attr_reader :rows
end