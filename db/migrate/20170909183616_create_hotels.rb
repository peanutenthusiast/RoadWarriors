class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :rating
      t.integer :price
      t.string :address

      t.timestamps
    end
  end
end
