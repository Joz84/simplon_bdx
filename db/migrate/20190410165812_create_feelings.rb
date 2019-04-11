class CreateFeelings < ActiveRecord::Migration[5.2]
  def change
    create_table :feelings do |t|
      t.references :user, foreign_key: true
      t.date :date
      t.integer :rating

      t.timestamps
    end
  end
end
