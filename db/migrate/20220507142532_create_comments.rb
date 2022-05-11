class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id, foreign_key:true, null:false
      t.integer :post_id, foreign_key:true, null:false
      t.text :comment, null:false, length: {maximum:50}

      t.timestamps


    end
  end
end
