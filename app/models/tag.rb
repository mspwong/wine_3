# == Schema Information
#
# Table name: tags
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  wine_id    :integer(4)      not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Tag < ActiveRecord::Base
  belongs_to :wine

  scope :red, lambda { where("name like ?", '%red%') }

  scope :to_come, lambda { where("created_at > ?", Time.zone.now) }
end
