# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :datetime         not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#

class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :sex, inclusion: { in: %w(m f), message: "%{value} is not m or f" }

  has_many :cat_rental_requests
end
