class CreateTagmaps < ActiveRecord::Migration[5.2]
  def change
    create_table :tagmaps do |t|
      t.references :event, type: :bigint, foreign_key: true
      t.references :artist, type: :bigint, foreign_key: true
      t.references :venue, type: :bigint, foreign_key: true
      t.references :tag, type: :bigint, foreign_key: true

      t.timestamps
    end
  end
end
