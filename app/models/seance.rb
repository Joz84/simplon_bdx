class Seance < ApplicationRecord
  has_many :daily_seances, dependent: :destroy
  has_many :batches, through: :daily_seances
end
