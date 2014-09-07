class RemoveDatesFromSkill < ActiveRecord::Migration
  def change
    remove_column(:skills, :doable_on)
    remove_column(:skills, :reliable_on)
    remove_column(:skills, :refined_on)
  end
end
