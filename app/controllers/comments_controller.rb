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

      @micropost  = current_user.microposts.build
      if params[:pflag]==nil || params[:pflag].to_i==0
        @feed_items = current_user.feed(0).paginate(page: params[:page])
      elsif params[:pflag].to_i==1
        @feed_items = current_user.feed(1).paginate(page: params[:page])
      else
        @feed_items = current_user.feed(2).paginate(page: params[:page])
      end

      @comments = current_user.comment_feed
      
      @arr_ups = Array.new
      @arr_downs = Array.new
      if current_user.upvoted!=nil
        @arr_ups = current_user.upvoted[1..-2].split(',').collect! {|n| n.to_i}
      end
      if current_user.downvoted!=nil
        @arr_downs = current_user.downvoted[1..-2].split(',').collect! {|n| n.to_i}
      end
      
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