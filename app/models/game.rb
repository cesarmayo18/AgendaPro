class Game < ApplicationRecord
    has_many :bets
    enum result: { green: 0, red: 1, black: 2}

    def self.play
        current_game = Game.create()
        Bet.round(current_game)
    end

end
