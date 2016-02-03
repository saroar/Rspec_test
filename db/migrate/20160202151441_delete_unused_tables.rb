class DeleteUnusedTables < ActiveRecord::Migration
  def change
    drop_table :pictures
    drop_table :albums
  end
end
