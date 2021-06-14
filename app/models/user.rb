class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blogs, dependent: :destroy

  validates :user_name, uniqueness: true, presence: true

  scope :inactive, -> { where(active: false) }

  def active_for_authentication?
    super && is_active?
  end

  def inactive_message
    is_active? ? super : 'Sorry, this account has been deactivated.'
  end

  def is_active?
    active
  end
end
