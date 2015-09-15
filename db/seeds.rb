# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer
#  start_date :date
#  end_date   :date
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

cats = Cat.create([ { name: 'Gizmo', birth_date: Date.today - 2000,
                      color: "black", sex: "F", description: "Ned's cat"},
                    { name: 'Chicago', birth_date: Date.today - 1000,
                      color: "black", sex: "M", description: "Cat from a strange town"},
                    { name: 'Ivan', birth_date: Date.today - 2000, color: "white",
                      sex: 'M', description: 'A lovely individual with many fond memories of Nicole' }
                      ])

requests = CatRentalRequest.create([
    {cat_id: 3, start_date: Date.today - 3, end_date: Date.today - 2, status: "APPROVED"},
    {cat_id: 3, start_date: Date.today - 4, end_date: Date.today - 2, status: "APPROVED"}
  ])
