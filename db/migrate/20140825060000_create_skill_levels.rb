class CreateSkillLevels < ActiveRecord::Migration
	def change
		create_table :skill_levels do |t|
			t.string :level
			t.string :organization
			t.date :achieved_on

			t.timestamps
		end
	end
end