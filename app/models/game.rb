class Game < ApplicationRecord
    has_many :bets
    enum result: { green: 0, red: 1, black: 2}

    def self.play
        current_game = Game.create()
        Bet.round(current_game)
        current_game.turn_the_roulette
        current_game.pay
    end

    def turn_the_roulette 
        self.result = Game.roulette_probability
        self.save
    end 

    def self.roulette_probability
        probability = {
            "red"  => 49,
            "black" => 49,
            "green"  => 2,
          }
        pickup = Pickup.new(probability)  
        return pickup.pick()
    end

    def pay
        bet_winners = self.bets.where(color:self.result)
        gain= if self.result == 0 then 15 else 2 end
        bet_winners.each do |bet|
            winner = bet.user
            winner.balance += bet.amount*gain
            winner.save
        end
    end
end
