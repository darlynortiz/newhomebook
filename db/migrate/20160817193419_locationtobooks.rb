class Locationtobooks < ActiveRecord::Migration
  def change
  	 rename_column :books, :location, :address
  end
 
end
