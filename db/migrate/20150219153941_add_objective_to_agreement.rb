class AddObjectiveToAgreement < ActiveRecord::Migration
  def change
    add_column :agreements, :objective, :json
  end
end
