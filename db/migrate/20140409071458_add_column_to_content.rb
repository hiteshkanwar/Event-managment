class AddColumnToContent < ActiveRecord::Migration
  def change
    add_column :contents, :user_id, :integer
  end
end