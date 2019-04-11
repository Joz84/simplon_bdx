class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :animal, :string
    add_column :users, :adjective, :string
    add_column :users, :avatar, :string
    add_column :users, :description, :text
    add_column :users, :birthday, :date
  end
end
