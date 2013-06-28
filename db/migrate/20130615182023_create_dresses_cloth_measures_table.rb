class CreateDressesClothMeasuresTable < ActiveRecord::Migration
  def up
    unless(table_exists?(:cloth_measures_dresses))
      create_table :cloth_measures_dresses, :id => false do |t|
        t.integer :dress_id
        t.integer :cloth_measure_id
          
        t.timestamps
      end
    end
  end

  def down
  end
end
