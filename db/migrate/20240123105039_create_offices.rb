class CreateOffices < ActiveRecord::Migration[7.1]
  def change
    create_table :offices do |t|
      t.string :title
      t.string :description
      t.string :localisation
      t.integer :price

      t.timestamps
    end
  end
end
