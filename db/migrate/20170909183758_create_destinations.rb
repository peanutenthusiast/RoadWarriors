class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.string :address, null: false

      t.timestamps
    end
  end
end
