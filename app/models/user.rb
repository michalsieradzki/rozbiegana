class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :team
  has_many :activities
  has_many :comments
  has_many :likes
  has_many :messages
  has_many :notifications, as: :recipient, dependent: :destroy
  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    super + _ransack_aliases.keys + _ransackers.keys
  end

  validates :username, presence: true

end
