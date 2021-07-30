class AddReferencesBetweenMunicipeAndEndereco < ActiveRecord::Migration[6.1]
  def change
    add_reference :enderecos, :municipe, index: true
    add_reference :municipes, :endereco, index: true
  end
end
