class CreateTagsDressesTable < ActiveRecord::Migration
  def up
    unless(table_exists?(:tags_dresses))
      create_table :tags_dresses, :id => false do |t|
        t.integer :dress_id
        t.integer :tag_id
          
        t.timestamps
      end
    end
  end

  def down
  end
end
