class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, type: :integer, foreign_key: true
      t.references :venue, type: :integer, foreign_key: true
      t.references :event, type: :integer, foreign_key: true
      t.string :content
      t.float :rate, null:false, default:0

      t.timestamps
    end
  end
end
