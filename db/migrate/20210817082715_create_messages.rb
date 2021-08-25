class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, type: :integer, foreign_key: true
      t.references :room, type: :integer, foreign_key: true
      t.text :message
      t.string :image_id
      t.timestamps
    end
  end
end
