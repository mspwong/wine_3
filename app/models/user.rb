# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  email      :string(255)
#  type       :string(255)     default("User")
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  active     :boolean(1)      default(TRUE)
#

class User < ActiveRecord::Base
  has_many :reviews, :foreign_key => "reviewer_id", :conditions => {:active => true}
  has_many :wines, :through => :reviews
  has_and_belongs_to_many :programs

  validates :name, :presence => true
  validates :name, :length => { :maximum => 50 }
  validates_associated :reviews
  validates_associated :wines

  after_update :update_reviews

  def update_reviews
    reviews.each do |r|
      r.update_attribute(:active, active)
    end
  end

end
