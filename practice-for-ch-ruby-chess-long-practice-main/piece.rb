require_relative "modules.rb"

class Piece
    include Slideable

    def initialize(board, color, pos)
        @board = board
        @color = color
        @pos = pos
    end

    attr_reader :pos, :board, :color

end
