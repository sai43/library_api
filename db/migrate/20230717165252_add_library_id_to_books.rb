class AddLibraryIdToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :library_id, :integer, null: false
  end
end
