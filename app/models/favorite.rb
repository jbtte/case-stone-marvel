class Favorite < ApplicationRecord
  belongs_to :user
  validates :user_id, :number, :name, presence: true
end
