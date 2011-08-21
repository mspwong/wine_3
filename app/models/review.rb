# == Schema Information
#
# Table name: reviews
#
#  id         :integer(4)      not null, primary key
#  body       :text
#  wine_id    :integer(4)      not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Review < ActiveRecord::Base
  belongs_to :wine

  validates_presence_of :wine
  #validates_presence_of :reviewer
  validates_length_of :body, :maximum => 100, :allow_blank => true
  #validates_exclusion_of :body, :in => %w(shit fuck), :message => "must not contained foul words"
  validates_each :body do |model, attr, value|
    next unless value

    bad = ['fuck', 'shit', 'fucking'].any? do |w|
      value.downcase.include? w.downcase
    end
    model.errors.add(attr, 'must not contain censored words') if bad
  end

end