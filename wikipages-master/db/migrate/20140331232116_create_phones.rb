class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.column :number, :integer
      t.column :contact_id, :integer
    end
  end
end
