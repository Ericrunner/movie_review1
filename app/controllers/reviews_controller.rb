class ReviewsController < ApplicationController
before_action :authenticate_user! ,only: [:new,:create,:join, :quit]
def index
  @reviews=Review.all.recent
end
def new
  @review=Review.new
end
def show
  @review=Review.find(params[:id])
  @posts=@review.posts.recent
end
def create
  @review=Review.new(review_params)
  if @review.save
    redirect_to reviews_path
  else
    render :new
  end
end
def join
   @review=Review.find(params[:id])
   if !current_user.is_favorites_of?(@review)
     current_user.join!(@review)
     flash[:notice] = "收藏成功！"
   end
   redirect_to review_path(@review)
end

def quit
   @review=Review.find(params[:id])
   if current_user.is_favorites_of?(@review)
     current_user.quit!(@review)
     flash[:alert] = "已取消收藏该电影！"
   end
   redirect_to review_path(@review)
end
private
def review_params
  params.require(:review).permit(:title,:description)
end
end
