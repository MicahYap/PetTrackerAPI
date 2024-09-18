class AddNextVisitToVets < ActiveRecord::Migration[7.2]
  def change
    add_column :vets, :next_visit, :date
  end
end
