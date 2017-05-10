class ChangeColumnTypeInEventsToAction < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :type, :action
  end
end
