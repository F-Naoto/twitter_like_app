class AddContentToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :content, :text, null:false
  end
end
