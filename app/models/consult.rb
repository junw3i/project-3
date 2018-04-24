class Consult < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :history, presence: true
  validates :doctor, presence: true
end
