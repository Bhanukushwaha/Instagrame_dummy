class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :tittel
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
