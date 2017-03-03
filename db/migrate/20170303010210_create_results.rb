class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.integer :user_id
      t.integer :issue_id

      t.timestamps
    end
    add_index :results, :user_id
    add_index :results, :issue_id
    add_index :results, [:user_id, :issue_id], unique: true
  end
end
