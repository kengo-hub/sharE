class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :venue_id, null: false, foreign_key: true
      t.integer :artist_id, null: false, foreign_key: true
      t.string :name, null: false
      t.date :event_date, null: false

      t.timestamps
    end
  end
end
