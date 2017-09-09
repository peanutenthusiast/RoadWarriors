class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.integer :search_count
      t.references :user, null: false
      t.references :destination, null: false

      t.timestamps
    end
  end
end
