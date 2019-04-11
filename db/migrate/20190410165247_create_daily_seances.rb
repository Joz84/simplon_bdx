class CreateDailySeances < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_seances do |t|
      t.references :seance, foreign_key: true
      t.references :batch, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
