class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :user_id
      t.string :number_code
      t.string :name
      t.integer :payments_count, default: 0, null: false


     t.timestamps
    end
    add_index :customers, :user_id
  end
end
