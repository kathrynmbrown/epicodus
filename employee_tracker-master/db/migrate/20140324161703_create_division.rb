class CreateDivision < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.column :name, :string

       t.timestamps
    end


  end
end
