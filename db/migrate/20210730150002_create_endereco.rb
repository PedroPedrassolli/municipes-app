class CreateEndereco < ActiveRecord::Migration[6.1]
  def change
    create_table :enderecos do |t|
      t.integer :zipcode
      t.string :address
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.integer :ibge_code

      t.timestamps
    end
  end
end
