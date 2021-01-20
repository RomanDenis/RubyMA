class User < ApplicationRecord
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :posts, dependent: :destroy
  has_many :images, as: :imageable

  scope :old, -> { where('birthday <= ?', 18.years.ago) }

  validates :personal_data, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :email, presence: true, format: { with: VALID_EMAIL }, uniqueness: true


  def full_name
    "#{first_name} #{last_name}"
  end
end
