class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :name,                null: false
      t.string :phonenumber,         null: false
      t.string :ordertimeleft,       null: false
      t.string :ordertimeright,      null: false
      t.string :howtoeat,            null: false
      t.string :people,              null: false
      t.string :couponcodenumber1
      t.string :couponcodenumber2
      t.string :couponcodenumber3
      t.integer :post_id
      # t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
