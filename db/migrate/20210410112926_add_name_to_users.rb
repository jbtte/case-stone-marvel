class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firs_name, :string
    add_column :users, :last_name, :string
  end
end
