class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]
  

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  @post = Post.find(params[:id])
  end  

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def like  
    @post = Post.find(params[:post_id])
    @post.likes.create(user_id: current_user.id)
    # UserMailer.welcome_email(@comment).deliver_now
    redirect_to post_path(@post)    
  end


  def unlike
    @post = Post.find(params[:post_id])
    @like = Like.where(:post_id=>params[:post_id], :user_id=>current_user.id).first
    #@like = @post.likes.first
    @like = @like.destroy
    redirect_to post_path(@post)
  end



  # POST /posts or /posts.json
  def create

    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|

      if @post.save
       images = params[:post][:image]
        if images.present?
          images.each do |img|
      
            picture = Picture.new(image: img, post_id: @post.id)
            #picture = @post.pictures.new(image: params[:post][:image])
            picture.save
          end
        end
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :user_id, :description, :image)
    end
end
  