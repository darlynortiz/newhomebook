class AddvalTousers < ActiveRecord::Migration
  def change
  	add_column :users, :val, :integer
  end
end
