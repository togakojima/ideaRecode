class Room < ApplicationRecord
  belongs_to :user
  has_many :ideas, dependent: :destroy

  validates :name, presence: true
end
