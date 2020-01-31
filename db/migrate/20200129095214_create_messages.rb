class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :customer,foreign_key: {to_table: :users},null: false
      t.references :sales,foreign_key: {to_table: :users},null: false
      t.text :text
      t.string :image
      t.references :car,foreign_key: true
      t.references :event,foreign_key: true

      t.timestamps
    end
  end
end
