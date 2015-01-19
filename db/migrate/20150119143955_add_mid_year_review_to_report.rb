class AddMidYearReviewToReport < ActiveRecord::Migration
  def change
    add_column :reports, :mid_year_review_smart, :json, default: []
    add_column :reports, :mid_year_review_development, :json, default: []
  end
end
