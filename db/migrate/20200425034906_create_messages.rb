class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :phonenumber
      t.string :ordertime
      t.string :howtoeat
      t.string :people
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
