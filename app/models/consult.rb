class Consult < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :history, presence: true
  validates :doctor, presence: true

  belongs_to :user, :class_name => "User"
  belongs_to :doctor, :class_name => "User"
end
