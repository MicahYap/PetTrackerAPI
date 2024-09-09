class RenameTypeToPetTypeInPets < ActiveRecord::Migration[7.2]
  def change
    rename_column :pets, :type, :pet_type
  end
end
