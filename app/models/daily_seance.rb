class DailySeance < ApplicationRecord
  belongs_to :seance
  belongs_to :batch
end
