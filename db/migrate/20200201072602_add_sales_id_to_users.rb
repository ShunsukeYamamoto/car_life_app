class AddSalesIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sales_id, :integer
  end
end
