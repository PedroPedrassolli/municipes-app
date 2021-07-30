class Municipe < ApplicationRecord
	validates :cep, :logradouro, :bairro, :cidade, :uf, presence: true
end