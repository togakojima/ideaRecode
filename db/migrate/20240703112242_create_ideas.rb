class CreateIdeas < ActiveRecord::Migration[7.0]
  def change
    create_table :ideas do |t|
      t.string :content 
      t.references :room, null: false, foreign_key: true 
      t.references :user, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
