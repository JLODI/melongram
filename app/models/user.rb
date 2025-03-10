class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { minimum: 4, maximum: 30 }

  has_one_attached :image
  has_many :posts, dependent: :destroy

  has_many :likes
  has_many :comments
end
