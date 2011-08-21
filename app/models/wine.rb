class Wine < ActiveRecord::Base
  has_many :tags, :dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
  validates_length_of :name, :maximum => 50
  validates_numericality_of :vintage, :only_integer => true, :allow_blank => true
  validates_presence_of :item_no
  validates_numericality_of :item_no, :only_integer => true
  #validates_associated :reviews
  validates_associated :tags

  accepts_nested_attributes_for :tags, :allow_destroy => true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? }}

  #after_update :update_associations

  #def update_associations
  #  reviews.each do |r|
  #    r.update_attribute(:active, active)
  #    r.save!
  #  end
  #end
end
