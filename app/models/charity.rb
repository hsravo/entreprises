class Charity < ApplicationRecord

  validates :id_association, presence: { message: 'Le RNA doit être valide' }, uniqueness: { message: 'Le RNA est déjà utilisé' }
  validates :name, presence: { message: 'Le nom doit être renseigné ou est déjà utilisé' }, uniqueness: { message: 'Le nom est déjà utilisé' }
  validates :acronym, presence: { message: 'Le nom court doit être renseigné ou est déjà utilisé' }, uniqueness: { message: 'Le nom court est déjà utilisé' }
  validates :email, uniqueness: { message: 'Cette adresse email est déjà utilisée' }
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:id_association]

end
