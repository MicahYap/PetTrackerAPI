class CreateGroomers < ActiveRecord::Migration[7.2]
  def change
    create_table :groomers do |t|
      t.date :calendar
      t.string :groomer
      t.date :next_visit
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
