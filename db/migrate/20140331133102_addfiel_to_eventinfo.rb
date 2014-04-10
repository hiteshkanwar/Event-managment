class AddfielToEventinfo < ActiveRecord::Migration
  def change
    add_column :eventinfos, :status, :boolean
  end
end
