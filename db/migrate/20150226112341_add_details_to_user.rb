class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :staff_number, :string
    add_column :users, :grade, :string
    add_column :users, :organisation, :string
  end
end
