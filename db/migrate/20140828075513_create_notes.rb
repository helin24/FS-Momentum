class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :text
      t.string :source
      t.belongs_to :skill

      t.timestamps
    end
  end

end
