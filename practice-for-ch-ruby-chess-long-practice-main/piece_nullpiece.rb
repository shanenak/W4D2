require_relative "piece.rb"

class NullPiece < Piece
    include Singleton # only create one instance

    def initialize
        
    end
end
