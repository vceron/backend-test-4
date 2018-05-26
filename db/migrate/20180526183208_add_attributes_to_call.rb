class AddAttributesToCall < ActiveRecord::Migration[5.1]
  def change
    add_column :calls, :callStatus, :string, after: :from
    add_column :calls, :fromCountry, :string, after: :from
    add_column :calls, :toCountry, :string, after: :from
  end
end
