class CreatePets < ActiveRecord::Migration[7.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :type
      t.string :breed
      t.date :birthday
      t.date :gotcha_day
      t.string :gender
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
