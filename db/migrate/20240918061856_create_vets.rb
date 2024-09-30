class CreateVets < ActiveRecord::Migration[7.2]
  def change
    create_table :vets do |t|
      t.date :calendar
      t.string :vet
      t.string :concern

      t.timestamps
    end
  end
end
