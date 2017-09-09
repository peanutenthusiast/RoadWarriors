class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user
      t.integer :favoritable_id, null: false
      t.string :favoritable_type, null: false

      t.timestamps
    end

    add_index :favorites, [:favoritable_type, :favoritable_id]
  end
end
