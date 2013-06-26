class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :email
      t.text :comment
      t.integer :user_id
      t.integer :supplier_id

      t.timestamps
    end
  end
end
