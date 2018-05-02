class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true, presence: true
  validates :first_name, :last_name, presence: true
  validates :mobile, length: { is: 8 }, numericality: { only_integer: true }
  validates :gender, presence: true
  validates :id_number, presence: true, length: { is: 9 }

  has_many :consult
  has_many :request 
end
