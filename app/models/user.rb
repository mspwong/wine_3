# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  has_many :reviews, :foreign_key => "reviewer_id"
  has_many :wines, :through => :reviews
  #has_and_belongs_to_many :programs

  validates_presence_of :name
  validates_length_of :name, :maximum => 50

  #after_update :update_reviews
  #
  #def update_reviews
  #  reviews.each do |r|
  #    r.update_attribute(:active, active)
  #  end
  #end

end
