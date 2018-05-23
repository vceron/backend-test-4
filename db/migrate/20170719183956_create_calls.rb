class CreateCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :calls, id: false do |t|
      t.string :call_id, primary_key: true
      t.string :to
      t.string :from
      t.string :callDirection
      t.timestamps
    end
  end
end
