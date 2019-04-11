class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :batch
  has_many :pair_users, dependent: :destroy
  has_many :pairs, through: :pair_users
  has_many :feelings, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :batch, presence: true

  def partner
    self.pairs.find_by(date: Date.today)
        .users
        .where
        .not(id: id)
        .first
  end

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def feeling
    feelings.find_by(date: Date.today)
  end
end
