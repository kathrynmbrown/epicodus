class AlterResultsTables < ActiveRecord::Migration
  def change
    rename_table :results_tables, :results
  end
end
