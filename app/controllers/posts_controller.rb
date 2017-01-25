class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

  def user_posts_index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

	def show
		@post = Post.find(params[:id])
	end

	def new
    user = User.find(params[:user_id])
		@post = user.posts.new
	end 

	def create
    user = User.find(params[:user_id])
    @post = user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, :notice => "New post was saved"
    else
      render "new"
    end 
	end

	def edit
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end 

	def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
    	redirect_to user_post_path(@post.id), :notice => "Your post has been updated"
    else
      render "edit"
    end 
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end


  private

    def post_params
      params.require(:post).permit(:title, :body, :user_id, tags: [])
    end

end