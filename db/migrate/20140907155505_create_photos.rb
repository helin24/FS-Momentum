class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |p|
      p.integer :user_id
      p.string :name, :file
    end
  end
end
