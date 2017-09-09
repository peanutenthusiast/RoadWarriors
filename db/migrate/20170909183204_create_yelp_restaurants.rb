class CreateYelpRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :yelp_restaurants do |t|
      t.integer :ratings
      t.integer :price_range
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
