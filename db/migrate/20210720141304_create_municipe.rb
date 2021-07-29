# frozen_string_literal: true

class CreateMunicipe < ActiveRecord::Migration[6.1]
  def change
    create_table :municipes do |t|
      t.string :name
      t.integer :cpf
      t.integer :cns
      t.string :email
      t.date :birthdate
      t.integer :phone
      t.boolean :status

      t.timestamps
    end
  end
end
