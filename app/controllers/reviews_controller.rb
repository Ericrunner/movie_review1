class ReviewsController < ApplicationController
before_action :authenticate_user! ,only: [:new,:create,:join,:quit,:edit,:update]
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
def edit
  @review=Review.find(params[:id])
end
def update
  @review=Review.find(params[:id])
  if @review.update(review_params)
    redirect_to review_path(@review),notice: "更新成功！"
  else
    render :edit
  end
end

def destroy
  @review=Review.find(params[:id])
  @review.destroy
  redirect_to reviews_path
end
def create
  @review=Review.new(review_params)
  @review.user=current_user
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
  params.require(:review).permit(:title,:description,:avatar)
end
end
