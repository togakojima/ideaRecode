class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_many :rooms, dependent: :destroy
  has_many :ideas, dependent: :destroy
  has_many :maps, dependent: :destroy
  has_many :calendars, dependent: :destroy
end
