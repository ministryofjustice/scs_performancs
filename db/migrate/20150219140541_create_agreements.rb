class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.timestamps null: false
    end
    add_reference :agreements, :user, index: true
    add_foreign_key :agreements, :users
  end
end
