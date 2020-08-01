class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :team, foreign_key: true
      t.references :match, foreign_key: true
      t.timestamps
    end
  end
end
