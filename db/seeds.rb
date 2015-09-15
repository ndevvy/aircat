# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#  id          :integer          not null, primary key
#  birth_date  :date
#  color       :string
#  name        :string
#  sex         :string(1)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime


cats = Cat.create([ { name: 'Gizmo', birth_date: Date.today - 2000,
                      color: "black", sex: "F", description: "Ned's cat"},
                    { name: 'Chicago', birth_date: Date.today - 1000,
                      color: "black", sex: "M", description: "Cat from a strange town"},
                    { name: 'Ivan', birth_date: Date.today - 2000, color: "white",
                      sex: 'M', description: 'A lovely individual with many fond memories of Nicole' }
                      ])
