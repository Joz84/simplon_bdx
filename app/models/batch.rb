class Batch < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :feelings, through: :users
end
