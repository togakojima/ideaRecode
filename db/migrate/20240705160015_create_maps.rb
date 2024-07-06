class CreateMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :maps do |t|
      t.decimal :latitude,  null: false, precision: 9, scale: 6
      t.decimal :longitude, null: false, precision: 9, scale: 6
      t.text :info
      t.string :title, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
