class AddColorToBet < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :color, :integer
  end
end
