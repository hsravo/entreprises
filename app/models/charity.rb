class Charity < ApplicationRecord

  validates :id_association, presence: { message: 'Le RNA doit être valide' }, uniqueness: { message: 'Le RNA est déjà utilisé' }
  
  validates :name, presence: { message: 'Le nom doit être renseigné ou est déjà utilisé' }, uniqueness: true
  validates :acronym, presence: { message: 'Le nom court doit être renseigné ou est déjà utilisé' }, uniqueness: true
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
