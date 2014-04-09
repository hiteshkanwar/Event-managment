class AddfielToEventinfo < ActiveRecord::Migration
  def change
    add_column :eventinfos, :status, :boolean, false
  end
end
