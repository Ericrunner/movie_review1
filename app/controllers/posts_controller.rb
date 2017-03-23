class PostsController < ApplicationController

def new
  @review=Review.find(params[:review_id])
  @post = Post.new
end
def create
  @review=Review.find(params[:review_id])
  @post = Post.new(post_params)
  @post.review=@review
  if @post.save
    redirect_to review_path(@review)
  else
    render :new
  end
end

private
def post_params
  params.require(:post).permit(:comment)
end
end
