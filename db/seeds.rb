require_relative '../app/models/skill_level'
require_relative '../app/models/skill'
require 'csv'

SkillLevel.delete_all
Skill.delete_all

# ISI skill_levels
SkillLevel.create(level: 'Pre-Alpha', organization: 'ISI', achieved_on: Date.new(2014,1,1))
SkillLevel.create(level: 'Alpha', organization: 'ISI', achieved_on: Date.new(2014,1,1))
SkillLevel.create(level: 'Beta', organization: 'ISI', achieved_on: Date.new(2014,1,15))
SkillLevel.create(level: 'Gamma', organization: 'ISI', achieved_on: Date.new(2014,2,1))
SkillLevel.create(level: 'Delta', organization: 'ISI', achieved_on: Date.new(2014,3,1))
SkillLevel.create(level: 'Freestyle 1', organization: 'ISI', achieved_on: Date.new(2014,4,1))
SkillLevel.create(level: 'Freestyle 2', organization: 'ISI', achieved_on: Date.new(2014,5,1))
SkillLevel.create(level: 'Freestyle 3', organization: 'ISI', achieved_on: Date.new(2014,7,1))
SkillLevel.create(level: 'Freestyle 4', organization: 'ISI')
SkillLevel.create(level: 'Freestyle 5', organization: 'ISI')
SkillLevel.create(level: 'Freestyle 6', organization: 'ISI')
SkillLevel.create(level: 'Freestyle 7', organization: 'ISI')
SkillLevel.create(level: 'Freestyle 8', organization: 'ISI')
SkillLevel.create(level: 'Freestyle 9', organization: 'ISI')
SkillLevel.create(level: 'Freestyle 10', organization: 'ISI')


# puts File.expand_path(File.dirname('__FILE__'))
# This is useful to see full path of current file

# Individual skills
CSV.foreach('lib/skills.csv', headers: true) do |row|
	skill = Skill.create(name: row['skill'])
  puts row.inspect
  puts row['skill']
  puts row['skill_level']
	skill.skill_level = SkillLevel.find_by(level: row['skill_level'])
	skill.save
end

# Notes
note1 = Note.create(text: "stand up!")
note1.skill = Skill.first
note1.save

