class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text   :image,           null: false
      t.string :couponcode,      null: false
      t.string :shopname,        null: false
      t.string :address,         null: false
      t.string :expirydate,      null: false
      t.timestamps
    end
  end
end
