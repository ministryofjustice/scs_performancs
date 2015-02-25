class DropAgreements < ActiveRecord::Migration
  def up
    drop_table :agreements
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't revert drop_table agreements"
  end
end
