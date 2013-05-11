class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.integer :chair
      t.float :value
      t.string :user
      t.datetime :timestamp

      t.timestamps
    end
  end
end
