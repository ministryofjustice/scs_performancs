class AddReviewPeriodToReports < ActiveRecord::Migration
  def change
    add_column :reports, :review_period, :string
  end
end
