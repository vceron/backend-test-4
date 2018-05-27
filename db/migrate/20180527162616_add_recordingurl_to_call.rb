class AddRecordingurlToCall < ActiveRecord::Migration[5.1]
  def change
    add_column :calls, :selection, :string, after: :from
    add_column :calls, :recordingURL, :string
  end
end
