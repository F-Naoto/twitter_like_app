class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null:false, length:{maximum:10}
      t.string :email, null:false, length:{maximum:30}
      #正規表現は別途
      t.timestamps
    end
  end
end
