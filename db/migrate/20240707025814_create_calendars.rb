class CreateCalendars < ActiveRecord::Migration[7.0]
  def change
    create_table :calendars do |t|
      t.string :title,        null: false
      t.text   :content,      null: false
      t.datetime :start_time, null: false
      t.references :user,     null: false, foreign_key: true

      t.timestamps
    end
  end
end
