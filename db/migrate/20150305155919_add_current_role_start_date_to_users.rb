class AddCurrentRoleStartDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_role_start_date, :string
  end
end
