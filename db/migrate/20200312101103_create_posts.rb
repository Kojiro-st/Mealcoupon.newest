class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text   :image
      t.string :shopname,        null: false
      t.string :address,         null: false
      t.string :expirydate,      null: false
      t.string :foodname,        null: false
      t.string :othercoupon1
      t.string :othercoupon2
      t.string :othercoupon3
      t.string :prefecture
      t.string :foodvariety
      t.text   :explanation
      t.timestamps
    end
  end
end
