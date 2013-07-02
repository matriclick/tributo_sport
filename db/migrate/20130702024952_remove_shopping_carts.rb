class RemoveShoppingCarts < ActiveRecord::Migration
  def up
    ShoppingCart.all.each do |sc|
      puts sc.id
      sc.destroy
    end
  end

  def down
  end
end
