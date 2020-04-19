class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text   :image
      t.string :couponcode,      null: false
      t.string :shopname,        null: false
      t.string :address,         null: false
      t.string :expirydate,      null: false
      t.string :foodname,        null: false
      t.string :prefecture
      t.string :foodvariety
      t.text   :explanation
      t.timestamps
    end
  end
end
