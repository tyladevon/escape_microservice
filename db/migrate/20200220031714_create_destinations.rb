class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :full_address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
