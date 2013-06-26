class RemoveUsersAndDressesNotRelevant < ActiveRecord::Migration
  def up
    aux = DressType.where('name not like "%deportiva%" and name not like "%deportivos%"')
    aux.each do |dt|
      dt.dresses.each do |d|
        d.destroy
      end
      puts dt.name
      dt.destroy
    end
  end

  def down
  end
end
