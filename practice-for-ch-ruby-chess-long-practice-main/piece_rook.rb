require_relative "piece.rb"

class Rook < Piece

    include Slideable

    # private
    def move_dirs
        horizontal_directions = horizontal_dirs
        moves(horizontal_directions)
    end
end
