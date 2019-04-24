class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def self.round(game)
    User.all.map do |user|
      bet = user.bet()
      user.save
      Bet.create(game:game,user:user,amount:bet) if bet > 0
    end
  end
end
