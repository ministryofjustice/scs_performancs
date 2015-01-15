class AddSmartToReport < ActiveRecord::Migration
  def change
    add_column :reports, :smart, :json
  end
end
