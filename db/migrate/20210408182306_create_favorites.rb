class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :number
      t.boolean :character

      t.timestamps
    end
  end
end
