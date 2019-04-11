class AddBatchToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :batch, foreign_key: true
  end
end
