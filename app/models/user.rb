class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :team
  has_many :activities
  has_many :comments
  has_many :likes
  has_one_attached :image
  has_many :notifications, as: :recipient, dependent: :destroy
  
  validates :username, presence: true

end
