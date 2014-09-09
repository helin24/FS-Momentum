
class CreateJoinTableUserSkill < ActiveRecord::Migration
  def change
    create_table :skills_users do |t|
      t.belongs_to :user
      t.belongs_to :skill
      t.datetime :doable_on, :reliable_on, :refined_on

      t.timestamps
    end
  end
end
