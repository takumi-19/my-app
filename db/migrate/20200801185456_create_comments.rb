class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :image
      t.references :supporter, foreign_key: true
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
