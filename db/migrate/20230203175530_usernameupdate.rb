class Usernameupdate < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user_id, :integer
    @users = User.where(user_name: nil) 
    @users.each do |user|
      user_n = user.email.split('@').first
      user.update(user_name: user_n)
    end
  end
end
