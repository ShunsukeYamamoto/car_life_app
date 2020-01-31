class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name,null: false
      t.date :inspection_date,null: false
      t.string :image,null: false
      t.integer :model_year,null: false
      t.references :user,foreign_key: true

      t.timestamps
    end
  end
end
