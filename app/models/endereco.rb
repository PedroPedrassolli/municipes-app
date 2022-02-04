class Endereco < ApplicationRecord
	belongs_to :municipe
	validates :zipcode, :address, :complement, :city, :neighborhood, :state, presence: true
end