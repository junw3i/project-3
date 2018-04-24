class Consult < ApplicationRecord

  belongs_to :user, :class_name => "User"
  belongs_to :doctor, :class_name => "User"

end
