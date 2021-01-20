class Group < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :images, as: :imageable
  has_many :banned_memberships, -> { where(status: :banned) }, class_name: 'Membership'
  has_many :banned_users, through: :banned_memberships, class_name: 'User', source: :user
  has_many :active_memberships, -> { where(status: :active) }, class_name: 'Membership'
  has_many :active_users, through: :active_memberships, class_name: 'User', source: :user
  validates :name, uniqueness: true
  validates :group_type, :status, presence: true

  enum status: [ :active, :archived, :removed, :permanently_removed], _default: 'active'

  def banned_users_emails
    banned_users.pluck(:email)
  end

  def active_users_count
    active_users.count
  end

end
