class CreateVaxes < ActiveRecord::Migration[7.2]
  def change
    create_table :vaxes do |t|
      t.date :calendar
      t.string :vet
      t.string :vaccine
      t.date :next_visit
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
