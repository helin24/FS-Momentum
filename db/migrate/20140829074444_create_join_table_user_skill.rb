
class CreateJoinTableUserSkill < ActiveRecord::Migration
  def change
    create_table :skills_users do |t|
      t.belongs_to :user
      t.belongs_to :skill
      t.date :doable_on, :reliable_on, :refined_on
    end
  end
end
