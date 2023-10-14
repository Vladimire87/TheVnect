# frozen_string_literal: true

class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: %i[show edit update destroy like]

  # GET /posts or /posts.json
  def index
    @posts = Post.includes([:user]).all
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to authenticated_root_path, notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to authenticated_root_path, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to authenticated_root_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    like = @post.likes.find_by(user: current_user)

    if like.present?
      like.destroy
    else
      @post.likes.create(user: current_user)
    end
    render turbo_stream: turbo_stream.replace(@post, partial: 'posts/post', locals: { post: @post })
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:body, :user_id)
  end
end
