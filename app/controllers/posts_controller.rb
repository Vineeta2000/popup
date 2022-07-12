class PostsController < ApplicationController
	def index
		@post = Post.all
	end

	def create 
		@post = current_user.posts.new(caption: params[:post][:caption])
		@post.save 
		#byebug
		params[:post][:picture].each do |picture|
		@photo = @post.photos.new(picture: picture)
		@photo.save 
	end

		redirect_to root_path
	end

	def show
		@post = Post.find_by(id: params[:id])
		@comments = @post.comments
		#byebug
		@photo = @post.photos
	end

	def new 
		@post = Post.new()
	end

	def edit   
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(caption: params[:post][:caption])
		@post.photos.destroy_all
		params[:post][:picture].each do |picture|

		@photo = @post.photos.new(picture: picture)
		@photo.save 
	end

		redirect_to root_path
	end 

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path
	end

	def create_comment
		#byebug
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(feedback: params[:feedback], user_id: current_user.id)
		@comment.save
		#byebug
		@comments = @post.comments

		respond_to do |format|
			format.js 
		end
	end

	def destroy_comment
		@comment = Comment.find(params[:comment_id])
		@post = @comment.post 
		@comment.destroy 
		@comments = @post.comments
		 respond_to do |format|
			format.js 
		end
		# redirect_to post_path(@post.id)
	end

	def like_comment
		@comment = Comment.find(params[:comment_id])
		@like = @comment.likes.new(user_id: current_user.id)
		@like.save 
		respond_to do |format|
			format.js
		end
	end

	def dislike_comment
		#byebug
		# @post = Post.find(params[:post_id])
		@comment = Comment.find(params[:comment_id])
		@like = @comment.likes.find_by_user_id(current_user.id)
		@like.destroy
	    respond_to do |format|
    	  format.js
    	end
    # redirect_to post_path(@post.id)
	end

	# def show_comment
 #   # byebug
 #   		@post = Post.find(params[:post_id])
 #   		@comment = Comment.find(params[:comment_id])
	# end

	# def create_post
	# 	byebug
	# 	# @user = User.find(params[:post][:user_id])
	# 	# @user.posts.new(caption: params[:post][:caption])
	# 	# @user.save
	# 	# @posts = Post.all
	# 	# redirect_to root_path
	# end

	def edit_comment
		byebug
	end

	def update_comment
		byebug
	end
 




end
