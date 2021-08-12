class AddImageIdToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :image_id, :string
  end
end
