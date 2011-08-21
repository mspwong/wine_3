# == Schema Information
#
# Table name: programs
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Program < ActiveRecord::Base
  has_and_belongs_to_many :users
end
