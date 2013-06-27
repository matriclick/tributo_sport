class RemoveCurrentTags < ActiveRecord::Migration
  def up
    Tag.all.each do |tag|
      puts tag.name
      tag.destroy
    end
    
    TagType.all.each do |tag_type|
      puts tag_type.name
      tag_type.destroy
    end
  end

  def down
  end
end
