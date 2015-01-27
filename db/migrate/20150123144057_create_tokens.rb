class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.references :user, null: false
      t.string :value, null: false

      t.timestamps null: false
    end
  end
end
