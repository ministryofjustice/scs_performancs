class AddEndYearReviewToReport < ActiveRecord::Migration
  def change
    add_column :reports, :end_year_review_smart, :json, default: []
    add_column :reports, :end_year_review_development, :json, default: []
    add_column :reports, :end_year_review_comment, :text
  end
end