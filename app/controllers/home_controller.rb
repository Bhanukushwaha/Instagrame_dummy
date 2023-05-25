class HomeController < ApplicationController
	skip_before_action :authenticate_user!, :only => [:home_modle, :sign_up, :sign_in]
	def index
		# following_id = current_user.follows.map(&:following_id)
		# follow_id = Follow.where(id: following_id)
		# @posts = Post.where(user_id: following_id)
		following_account_ids = Follow.where('user_id = ?', current_user.id).map(&:following_id)
		following_account_ids << current_user.id
		posts_ids = User.where(id: following_account_ids).eager_load(:posts).pluck('posts.id').uniq
	  @posts = Post.where(id: posts_ids ).order("created_at DESC")#.paginate(page: params[:page], per_page: 10)
	end
	def home_modle
	 	respond_to do |format|
	    format.js {}
	  end
  end  
end