class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :image
      t.string :name
      t.text :introduction
      t.integer :rate
      t.text :located
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
