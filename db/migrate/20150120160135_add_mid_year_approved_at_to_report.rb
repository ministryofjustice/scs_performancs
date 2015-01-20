class AddMidYearApprovedAtToReport < ActiveRecord::Migration
  def change
    add_column :reports, :mid_year_approved_at, :datetime
  end
end
