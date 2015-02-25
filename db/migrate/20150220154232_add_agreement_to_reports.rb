class AddAgreementToReports < ActiveRecord::Migration
  def change
    add_column :reports, :agreement, :json
  end
end
