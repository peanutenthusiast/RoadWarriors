class CreateYelpRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :yelp_restaurants do |t|
      t.integer :ratings
      t.integer :price_range
      t.string :name, null: false
      t.string :address, null: false

      t.timestamps
    end

  end
end
