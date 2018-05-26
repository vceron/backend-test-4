class AddDurationToCall < ActiveRecord::Migration[5.1]
  def change
    add_column :calls, :finished_at, :timestamp, after: :from
    add_column :calls, :duration, :integer, after: :from
  end
end
