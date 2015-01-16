class AddDefaultsToDeveplemtAndSmart < ActiveRecord::Migration
  def up
    change_column :reports, :development, :json, default: []
    change_column :reports, :smart, :json, default: []
  end

  def down
    change_column :reports, :development, :json, default: nil
    change_column :reports, :smart, :json, default: nil
  end
end
