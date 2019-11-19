class CreateClockEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :clock_events do |t|
      t.datetime :clock_in
      t.datetime :clock_out
      t.integer :teacher_id

      t.timestamps
    end
  end
end
