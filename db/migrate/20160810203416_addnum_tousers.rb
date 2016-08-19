class AddnumTousers < ActiveRecord::Migration
  def change
  	add_column :users, :num_val, :integer
  end
end
