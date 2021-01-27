class Charity < ApplicationRecord

  validates :id_association, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :acronym, presence: true, uniqueness: true
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
