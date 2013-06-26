class RemoveUsers < ActiveRecord::Migration
  def up
    u = User.where('email not like "%hhanckes%"')
    u.each do |user|
      puts user.email
      user.destroy
    end
  end

  def down
  end
end
