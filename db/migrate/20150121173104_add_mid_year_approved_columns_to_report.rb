class AddMidYearApprovedColumnsToReport < ActiveRecord::Migration
  def change
    add_column :reports, :mid_year_approved_comment, :text
    add_column :reports, :mid_year_approved_snapshot_development, :json
    add_column :reports, :mid_year_approved_snapshot_smart, :json
  end
end
