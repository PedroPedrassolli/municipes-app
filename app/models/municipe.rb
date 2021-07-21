class Municipe < ApplicationRecord
	has_one_attached :photo

	validates :name, :cpf, :cns, :email, :birthdate, :phone, :photo, :status, presence: true
  validates :cpf, length: { is: 11 }
  validates :cns, length: { is: 15 }
  validates :phone, length: { is: 11 }
  validates_format_of :email,:with => Devise::email_regexp

  validates :cpf, :email, :phone, :cns, uniqueness: true
end