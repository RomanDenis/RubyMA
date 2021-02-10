class User < ApplicationRecord
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :posts, dependent: :destroy
  has_many :images, as: :imageable
  has_many :memberships
  has_many :groups, through: :memberships

  scope :old, -> { where('birthday <= ?', 18.years.ago) }

  validates :personal_data, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :email, presence: true, format: { with: VALID_EMAIL }, uniqueness: true


  def full_name
    "#{first_name} #{last_name}"
  end
  def personal_data=(value)
    value = JSON.parse(value) if value.is_a? String
    super(value)
  rescue JSON::ParserError
    super(value)
  end
end
