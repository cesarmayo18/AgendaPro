class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :game
  enum color: { green: 0, red: 1, black: 2}

  def self.round(game)
    User.all.map do |user|
      bet_amount = user.bet_amount()
      bet_color = Game.roulette_probability
      Bet.create(game:game,user:user,amount:bet_amount,color:bet_color) if bet_amount > 0
    end
  end
end
