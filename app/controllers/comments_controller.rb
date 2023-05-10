class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.create(comment_params)  
    # render post_path(@post)
    # respond_to do |format| 
    #   format.js
    # end      
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json 

  def destroy    
    @post = Post.find(params[:post_id])
    @comment.destroy
    # redirect_to post_path(@post), status: :see_other
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def comment_params
    #   params.fetch(:comment, {})
    # end
    def comment_params
      params.require(:comment).permit(:title, :post_id, :user_id)
    end
end
