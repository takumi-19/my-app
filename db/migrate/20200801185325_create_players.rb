class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :player_name, null: false
      t.integer :uniform_number, null: false
      t.string :position
      t.string :foot
      t.integer :height
      t.integer :weight
      t.references :team, foreign_key: true
      t.timestamps
    end
  end
end
