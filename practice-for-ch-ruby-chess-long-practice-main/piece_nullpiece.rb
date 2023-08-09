require_relative "piece.rb"
require "singleton"

class NullPiece < Piece
    include Singleton # only create one instance

    attr_reader :symbol, :color

    def initialize
        @color = nil
        @symbol = nil
    end

end
