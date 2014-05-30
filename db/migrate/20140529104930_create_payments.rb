class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :customer_id
      t.integer :user_id
      t.integer :amount
      t.string :description

      t.timestamps
    end
  end
end
