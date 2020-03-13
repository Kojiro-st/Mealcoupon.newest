class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :image
      t.string :couponcode
      t.string :shopname
      t.string :address
      t.string :expirydate
      t.timestamps
    end
  end
end
