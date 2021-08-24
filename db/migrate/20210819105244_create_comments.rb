class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, type: :integer, foreign_key: true
      t.references :venue, type: :integer, foreign_key: true
      t.references :event, type: :integer, foreign_key: true
      t.references :review, type: :integer, foreign_key: true
      t.string :content
      t.string :image_id
      t.timestamps
    end
  end
end
