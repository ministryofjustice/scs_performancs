class AddApprovedAtToAgreements < ActiveRecord::Migration
  def change
    add_column :agreements, :approved_at, :datetime
    add_column :agreements, :mid_year_approved_at, :datetime
    add_column :agreements, :end_year_approved_at, :datetime
  end
end
