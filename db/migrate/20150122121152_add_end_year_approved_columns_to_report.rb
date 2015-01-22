class AddEndYearApprovedColumnsToReport < ActiveRecord::Migration
  def change
    add_column :reports, :end_year_approved_at, :datetime
    add_column :reports, :end_year_approved_comment, :text
    add_column :reports, :end_year_approved_snapshot_development, :json
    add_column :reports, :end_year_approved_snapshot_smart, :json
  end
end
