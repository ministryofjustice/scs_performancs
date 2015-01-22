class AddApprovedColumnsToReport < ActiveRecord::Migration
  def change
    add_column :reports, :approved_comment, :text
    add_column :reports, :approved_snapshot_development, :json
    add_column :reports, :approved_snapshot_smart, :json
  end
end
