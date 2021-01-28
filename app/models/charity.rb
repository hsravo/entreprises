class Charity < ApplicationRecord

  validates :id_association, presence: { message: 'Le RNA doit être valide' }, uniqueness: { message: 'Le RNA est déjà utilisé' }
  validates :name, presence: { message: 'Le nom doit être renseigné ou est déjà utilisé' }, uniqueness: { message: 'Le nom est déjà utilisé' }
  validates :code_gestion, presence: { message: 'Le code gestion doit être renseigné' }
  validates :adresse_code_postal, presence: { message: 'Le code postal doit être renseigné' }
  validates :adresse_libelle_commune, presence: { message: 'La commune doit être renseignée' }
  validates :date_creation, presence: { message: 'La date de création doit être renseignée' }
  validates :email, presence: true, uniqueness: { message: 'Cette adresse email est déjà utilisée' }

  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:id_association]

end
