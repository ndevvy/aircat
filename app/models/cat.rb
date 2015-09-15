# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date
#  color       :string
#  name        :string
#  sex         :string(1)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Cat < ActiveRecord::Base

  COLORS = %w(orange black white grey calico)

  validates :name, presence: true
  validates :sex, inclusion: { in: %w(M F),
    message: "%{value} is not a valid sex" }
  validates :color, inclusion: { in: COLORS,
    message: "%{value} is not a valid color" }

  def age
    age = Date.today.year - birth_date.year
    age -= 1 if Date.today < birth_date + age.years #for days before birthday
  end

end
