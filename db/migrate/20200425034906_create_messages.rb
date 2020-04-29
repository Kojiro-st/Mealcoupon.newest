class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :phonenumber
      t.string :ordertimeleft
      t.string :ordertimeright
      t.string :howtoeat
      t.string :people
      t.string :couponcodenumber1
      t.string :couponcodenumber2
      t.string :couponcodenumber3
      t.integer :post_id
      # t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
