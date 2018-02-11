class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :partner_percentage, :float
    add_column :users, :is_admin, :boolean
    add_column :users, :reff_code, :string
  end
end
