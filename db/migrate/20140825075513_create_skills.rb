class CreateSkills < ActiveRecord::Migration
	def change
		create_table :skills do |t|
			t.string :name
			t.date :doable_on, :reliable_on, :refined_on
      t.belongs_to :skill_level

			t.timestamps
		end
	end
end
