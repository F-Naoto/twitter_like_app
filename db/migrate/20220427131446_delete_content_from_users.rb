class DeleteContentFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :content, :text
  end
end
