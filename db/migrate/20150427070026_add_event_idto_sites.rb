class AddEventIdtoSites < ActiveRecord::Migration
  def change
  	add_column :sites, :event_id, :integer
  end
end
