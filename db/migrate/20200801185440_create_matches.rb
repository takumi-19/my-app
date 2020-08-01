class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :week, null: false
      t.datetime :kick_off, null: false
      t.references :home_team, foreign_key: { to_table: :teams }, null: false
      t.references :away_team, foreign_key: { to_table: :teams }, null: false
      t.references :stadium, foreign_key: true, null: false
      t.integer :home_team_score
      t.integer :away_team_score
      t.timestamps
    end
  end
end
