class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.timestamps null: false

      t.string   :name,        null: false
      t.string   :phone
      t.string   :budget
      t.string   :status
      t.datetime :start
      t.datetime :finish
      t.text     :description, null: false
      t.integer  :site_id
      t.integer  :user_id
      t.boolean  :all_day,     null: false, default: false
    end
    add_index :events, :name
  end
end
