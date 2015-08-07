class CreateBarbers < ActiveRecord::Migration
  def change
  create_table :barbers do |t|
  t.text :name
  t.timestamps
  end
  end
end
