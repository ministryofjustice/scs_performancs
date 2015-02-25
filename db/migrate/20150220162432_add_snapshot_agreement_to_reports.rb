class AddSnapshotAgreementToReports < ActiveRecord::Migration
  def change
    add_column :reports, :approved_snapshot_agreement, :json
    add_column :reports, :mid_year_approved_snapshot_agreement, :json
    add_column :reports, :end_year_approved_snapshot_agreement, :json
  end
end
