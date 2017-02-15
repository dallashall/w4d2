class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
        t.timestamp :birth_date, null: false
        t.string :color, null: false
        t.string :name, null: false
        t.string :sex, limit: 1, null: false
        t.text :description, null: false
    end
  end
end
