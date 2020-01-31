class AddTalkerIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :talker_id, :integer
  end
end
