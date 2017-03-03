class AddOptionToResults < ActiveRecord::Migration[5.0]
  def change
    add_column :results, :option_id, :integer
  end
end
