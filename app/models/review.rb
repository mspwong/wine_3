# == Schema Information
#
# Table name: reviews
#
#  id          :integer(4)      not null, primary key
#  reviewer_id :integer(4)      not null
#  body        :text
#  wine_id     :integer(4)      not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  active      :boolean(1)      default(TRUE)
#

class Review < ActiveRecord::Base
  belongs_to :wine
  belongs_to :reviewer, :class_name => "User"

  validates :wine, :reviewer, :presence => true
  validates :body, :length => { :maximum => 100, :allow_blank => true }
  #validates_exclusion_of :body, :in => %w(shit fuck), :message => "must not contained foul words"
  validates_each :body do |model, attr, value|
    next unless value

    bad = ['fuck', 'shit', 'fucking'].any? do |w|
      value.downcase.include? w.downcase
    end
    model.errors.add(attr, 'must not contain censored words') if bad
  end

end
