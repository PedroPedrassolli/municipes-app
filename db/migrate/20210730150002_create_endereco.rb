class CreateEndereco < ActiveRecord::Migration[6.1]
  def change
    create_table :enderecos do |t|
      t.string :cep
      t.integer :logradouro
      t.integer :complemento
      t.string :bairro
      t.date :cidade
      t.integer :uf
      t.boolean :codigo_ibge

      t.timestamps
    end
  end
end
