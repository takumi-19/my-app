class CreateStadia < ActiveRecord::Migration[6.0]
  def change
    create_table :stadia do |t|
      t.string :stadium_name, null: false
      t.string :city, null: false
    end
  end
end
