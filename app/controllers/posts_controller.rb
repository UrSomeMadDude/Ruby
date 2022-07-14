class PostsController < ApplicationController
	def index
		@posts = Post.includes(:user).all
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to posts_path
		else
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = current_user.posts.find(params[:id])
	end

	def update
		@post = current_user.posts.find(params[:id])
		if @post.update(post_params)
			redirect_to @post
		else
			render :edit
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

end