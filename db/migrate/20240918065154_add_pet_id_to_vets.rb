class AddPetIdToVets < ActiveRecord::Migration[7.2]
  def change
    add_column :vets, :pet_id, :integer
    add_index :vets, :pet_id
    add_foreign_key :vets, :pets
  end
end
