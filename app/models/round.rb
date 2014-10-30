class Round < ActiveRecord::Base
  # Remember to create a migration!
    validates :game_id, presence: true
    validates :win, presence: true
    validates :lose, presence: true
    validates :win_time, presence: true
end
