class DeleteBabyClothing < ActiveRecord::Migration
  def up
    DressType.where('name like "%bebe%" or name like "%tu-casa%"').each do |dt|
      dt.dresses.each do |dress|
        puts dress.introduction
        dress.destroy
      end
    end
  end

  def down
  end
end
