class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.integer :boat_id
      t.integer :job_id

      t.timestamps
    end
      add_index :assignments, :boat_id
      add_index :assignments, :job_id
      add_index :assignments, [:boat_id, :job_id], unique: true
  end
end
