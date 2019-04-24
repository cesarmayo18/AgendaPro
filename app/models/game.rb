class Game < ApplicationRecord
    has_many :bets
    enum amount: { green: 0, red: 1, black: 2}
end
