class Player < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, uniqueness: true, presence: true

  has_many :rounds

end
