class FixColumnNameUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :firs_name, :first_name
  end
end
