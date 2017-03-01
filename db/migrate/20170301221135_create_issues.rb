class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :desc1
      t.string :desc2
      t.string :type

      t.timestamps
    end
  end
end
