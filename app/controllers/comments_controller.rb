class CommentsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def create
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to root_url
    else
      @feed_comments = []
      render 'static_pages/home'
    end
  end

  def destroy
    @comment.destroy
    redirect_to root_url(:pflag => params[:pflag])
  end

  private

    def correct_user
      @comment = current_user.comments.find_by_id(params[:id])
      redirect_to root_url if @comment.nil?
    end
end