class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :job_title
      t.integer :manager_id

      t.timestamps null: false
    end

    add_index "users", ["email"], unique: true
    add_index "users", ["manager_id"]
  end
end
