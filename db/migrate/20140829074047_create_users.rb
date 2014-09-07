class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :email, :password_hash, :about
      t.date :birthday

      t.timestamps
    end
  end
end
