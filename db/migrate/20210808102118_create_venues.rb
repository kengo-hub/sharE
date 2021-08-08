class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.integer :prefectures, null: false

      t.timestamps
    end
  end
end
