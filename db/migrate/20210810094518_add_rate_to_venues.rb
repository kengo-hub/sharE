class AddRateToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :rate, :float, null: false, default: 0
  end
end
