class AddColumnUserToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :user_id, :integer
    add_column :notes, :publicness, :string
  end
end
