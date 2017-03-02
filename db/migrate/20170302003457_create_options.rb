class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.text :option
      t.references :issue, foreign_key: true

      t.timestamps
    end
    add_index :options, [:issue_id, :created_at]
  end
end
