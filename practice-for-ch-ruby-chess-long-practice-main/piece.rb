require_relative "modules.rb"

class Piece
    attr_accessor :pos, :board, :color
    include Slideable

    def initialize(board, color, pos)
        @board = board
        @color = color
        @pos = pos
    end



end
