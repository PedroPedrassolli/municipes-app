class CreateEndereco < ActiveRecord::Migration[6.1]
  def change
    create_table :enderecos do |t|
      t.string :zipcode
      t.integer :address
      t.integer :complement
      t.string :neighborhood
      t.date :city
      t.integer :state
      t.boolean :ibge_code

      t.timestamps
    end
  end
end
