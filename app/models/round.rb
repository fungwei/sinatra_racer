class Round < ActiveRecord::Base
  # Remember to create a migration!
    validates :game_id, presence: true
    validates :winner_id, presence: true
    validates :loser_id, presence: true
    validates :win_time, presence: true

    belongs_to :game
    belongs_to :winner, class_name: "Player"
    belongs_to :loser, class_name: "Player"
end
