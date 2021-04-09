class AddUrlToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_column :favorites, :url, :string
  end
end
