class LikesController < ApplicationController

before_action :find_post
before_action :find_like, only: [:destroy]





  def like
    @post = Post.find(params[:post_id])
    @like = Like.create(:likeable_id=>params[:post_id], :likeable_type=>"post", :user_id=>current_user.id)
    # UserMailer.welcome_email(@post).deliver_now
    
    redirect_to post_path(@post)
  end

  def find_like
   @like = @post.likes.find(params[:id])
end



  def already_liked?
  Like.where(user_id: current_user.id, post_id:
  params[:post_id]).exists?
end

  def unlike
    @post = post.find(params[:post_id])
    # @like = Like.where(:post_id=>params[:post_id], :user_id=>current_user.id).first
    @like = @post.likes.first
    @like = @like.destroy
    redirect_to post_path(@post)
  end
  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to post_path(@post)
  end


  def destroy
  if !(already_liked?)
    flash[:notice] = "Cannot unlike"
  else
    @like.destroy
  end
  redirect_to post_path(@post)
end




  private
  def find_post
    @post = Post.find(params[:post_id])
  end	
end
