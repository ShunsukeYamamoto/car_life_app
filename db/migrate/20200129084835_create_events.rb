class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :customer,foreign_key: {to_table: :users},null: false
      t.references :sales,foreign_key: {to_table: :users},null: false
      t.string :title,null: false
      t.date :date,null: false
      t.references :car,foreign_key: true

      t.timestamps
    end
  end
end
