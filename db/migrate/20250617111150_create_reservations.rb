class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :roomImage
      t.string :roomName
      t.text :roomIntroduction
      t.integer :roomRate
      t.datetime :checkIn
      t.datetime :checkOut
      t.integer :numberOfPeople
      t.references :user,:room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
