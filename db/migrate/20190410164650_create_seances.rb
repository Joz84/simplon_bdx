class CreateSeances < ActiveRecord::Migration[5.2]
  def change
    create_table :seances do |t|
      t.integer :position
      t.text :content

      t.timestamps
    end
  end
end
