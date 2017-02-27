class AddUserIdToCategories < ActiveRecord::Migration[5.0]
  def up
    add_column :categories, :user_id, :integer
  end

  def down
  end
end