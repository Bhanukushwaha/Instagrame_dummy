class AddLikeTypeToLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :likeable_type, :string
  end
end
