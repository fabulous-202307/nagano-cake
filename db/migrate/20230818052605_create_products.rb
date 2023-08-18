class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|

      t.integer :genre_id, null: false
      t.string :name, null: false
      t.integer :price, null: false
      t.text :detail, null: false
      t.boolean :is_available, null: false, default: true

      t.timestamps
    end
  end
end
