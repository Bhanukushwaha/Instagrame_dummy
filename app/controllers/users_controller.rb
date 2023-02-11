class UsersController < ApplicationController 

   def profile
   	 @posts = current_user.posts
   end

   def index
     @users = User.where.not(id: current_user.id)
   end

   def show
    @user = User.find(params[:id])
   end

   def follow
    following_data = Follow.find_by(user_id:current_user.id, following_id:params[:following_id])
    if following_data.present?
      notice = "You have already follow this user"
    else
      Follow.create(user_id:current_user.id, following_id:params[:following_id])
      notice = "successfully followed."
    end
    if params[:follow_by].present?
      redirect_to user_path(params[:following_id]), notice: notice
    else
      redirect_to users_path, notice: notice
    end
  end

  def unfollow
    unfollowing_date = Follow.find_by(user_id:current_user.id, following_id:params[:following_id])
    unfollowing_date.destroy if unfollowing_date.present?
    if params[:follow_by].present?
      redirect_to user_path(params[:following_id]), notice: "successfully Unfollowed."
    else
      redirect_to users_path, notice: "successfully Unfollowed."
    end
  end
end