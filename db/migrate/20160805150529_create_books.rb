class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.string :category
      t.string :picture
      t.string :status
      t.string :location

      t.timestamps null: false
    end
  end
end
