class CreateEventinfos < ActiveRecord::Migration
  def change
    create_table :eventinfos do |t|
      t.integer :manager_id
      t.integer :client_id
      t.integer :person_id

      t.timestamps
    end
  end
end
