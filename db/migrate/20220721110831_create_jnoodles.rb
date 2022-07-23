class CreateJnoodles < ActiveRecord::Migration[5.2]
  def change
    create_table :jnoodles do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :shop, null: false
      t.text :body, null: false
      t.string :image_id, null: false

      t.timestamps
    end
  end
end
