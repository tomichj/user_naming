class AddNameToUsers < ActiveRecord::Migration<%= migration_version %>
  def change
    add_column :users, :name, :string
  end
end
