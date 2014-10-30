class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :game_id, null: false
      t.integer :winner_id, null: false
      t.integer :loser_id, null: false
      t.float   :win_time, null: false
      t.timestamps
    end
  end
end
