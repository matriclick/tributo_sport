class DeleteAllPosts < ActiveRecord::Migration
  def up
    Post.all.each do |post|
      puts post.title
      post.destroy
    end
  end

  def down
  end
end
