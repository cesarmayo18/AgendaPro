class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.integer :amount
      t.references :users, foreign_key: true
      t.references :games, foreign_key: true

      t.timestamps
    end
  end
end
