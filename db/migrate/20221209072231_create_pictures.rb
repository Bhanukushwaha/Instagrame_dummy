class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.integer :Post_id
      t.string :image

      t.timestamps
    end
  end
end
