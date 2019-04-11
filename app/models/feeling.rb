class Feeling < ApplicationRecord
  belongs_to :user
  enum rating: { bad: 0, ok: 1, good: 2, great: 3 }
  validates :date, presence: true
  validates :rating, presence: true
  validates :user, presence: true
  validates :date, uniqueness: { scope: :user }
end
