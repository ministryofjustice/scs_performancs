class AddFinalRatingToReports < ActiveRecord::Migration
  def change
    add_column :reports, :final_rating, :integer, default: 0
  end
end
