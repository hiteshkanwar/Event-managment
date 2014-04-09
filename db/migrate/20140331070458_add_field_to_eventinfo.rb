class AddFieldToEventinfo < ActiveRecord::Migration
  def change
    add_column :eventinfos, :event_id, :integer
  end
end
