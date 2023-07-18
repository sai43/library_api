class AddColumnsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :author_id, :integer, null: false
    add_column :books, :checked_out_by_id, :integer, null: true 
  end
end
