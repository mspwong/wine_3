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

class Buyer < User

end
