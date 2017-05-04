class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :type
      t.string :url

      t.timestamps
    end
  end
end
