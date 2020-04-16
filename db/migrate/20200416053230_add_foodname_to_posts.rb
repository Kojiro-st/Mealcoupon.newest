class AddFoodnameToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :foodname, :string,   null: false
  end
end
