class Pair < ApplicationRecord
  has_many :pair_users, dependent: :destroy
  has_many :users, through: :pair_users
end
