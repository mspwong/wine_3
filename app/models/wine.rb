# == Schema Information
#
# Table name: wines
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  varietal   :string(255)
#  vintage    :integer(4)
#  region     :string(255)
#  item_no    :integer(4)      not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  active     :boolean(1)      default(TRUE)
#

class Wine < ActiveRecord::Base
  has_many :tags, :dependent => :destroy
  has_many :reviews, :dependent => :destroy
  has_many :reviewers, :through => :reviews

  validates :name, :item_no, :presence => true
  validates :name, :uniqueness => { :case_sensitive => false }
  validates :name, :length => { :maximum => 50 }
  validates :vintage, :numericality => { :only_integer => true, :allow_blank => true }
  validates :item_no, :numericality => { :only_integer => true }
  validates_associated :reviews
  validates_associated :tags
  #validates_associated :reviewers

  after_initialize :initialize_me
  after_find { puts "#{'!'*20} after finding wine" }

  accepts_nested_attributes_for :tags, :allow_destroy => true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? }}

  after_update :update_associations

  def update_associations
    reviews.each do |r|
      r.update_attribute(:active, active)
      r.save!
    end
  end

  protected

  def initialize_me
    puts "#{'!'*20} after initializing wine"
  end

  def after_initialize
    puts "#{'!'*20} after initialize method"
  end

  def after_find
    puts "#{'!'*20} after find method"
  end


end
