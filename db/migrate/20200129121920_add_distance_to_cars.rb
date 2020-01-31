class AddDistanceToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :distance, :integer,null: false
  end
end
