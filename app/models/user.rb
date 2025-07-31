class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :team
  has_many :activities, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy
  has_one_attached :image

  scope :active, -> { where(deleted_at: nil) }
  scope :deleted, -> { where.not(deleted_at: nil) }

  def soft_delete!
    update(deleted_at: Time.current)
  end

  def restore!
    update(deleted_at: nil)
  end

  def deleted?
    deleted_at.present?
  end

  def self.ransackable_attributes(auth_object = nil)
    super + _ransack_aliases.keys + _ransackers.keys
  end

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  private

  def password_required?
    new_record? || password.present?
  end
end
