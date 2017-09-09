class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.integer :search_count
      t.integer :user_id, null: false
      t.integer :destination_id, null: false

      t.timestamps
    end
  end
end
