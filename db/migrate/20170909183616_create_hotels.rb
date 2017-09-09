class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name, null: false
      t.integer :rating
      t.integer :price
      t.string :address, null: false

      t.timestamps
    end
  end
end
