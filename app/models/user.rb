class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :first_name, :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "Only allows letters" }
  validates :mobile, length: { is: 8 }, numericality: { only_integer: true }
  validates :id_number, presence: true, length: { is: 9 }

  has_many :consult

end
