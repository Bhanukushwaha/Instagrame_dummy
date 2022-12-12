class RenameColumnToPictures < ActiveRecord::Migration[6.0]
  def change
    rename_column :pictures, :Post_id, :post_id
  end
end
