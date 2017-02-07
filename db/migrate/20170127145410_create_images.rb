class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :title
      t.integer :category_id
      t.string :picture

      t.timestamps
    end
  end
end
