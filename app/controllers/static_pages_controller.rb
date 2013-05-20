class StaticPagesController < ApplicationController
  def home
  	if signed_in?
      @post_flag=0
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed(0).paginate(page: params[:page])
      
      @arr_ups = Array.new
      @arr_downs = Array.new
      if current_user.upvoted!=nil
        @arr_ups = current_user.upvoted[1..-2].split(',').collect! {|n| n.to_i}
      end
      if current_user.downvoted!=nil
        @arr_downs = current_user.downvoted[1..-2].split(',').collect! {|n| n.to_i}
      end
    end
  end

  def home_top
    if signed_in?
      @post_flag=1
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed(1).paginate(page: params[:page])

      
      @arr_ups = Array.new
      @arr_downs = Array.new
      if current_user.upvoted!=nil
        @arr_ups = current_user.upvoted[1..-2].split(',').collect! {|n| n.to_i}
      end
      if current_user.downvoted!=nil
        @arr_downs = current_user.downvoted[1..-2].split(',').collect! {|n| n.to_i}
      end
    end
  end

  def home_old
    if signed_in?
      @post_flag=2
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed(2).paginate(page: params[:page])

      
      @arr_ups = Array.new
      @arr_downs = Array.new
      if current_user.upvoted!=nil
        @arr_ups = current_user.upvoted[1..-2].split(',').collect! {|n| n.to_i}
      end
      if current_user.downvoted!=nil
        @arr_downs = current_user.downvoted[1..-2].split(',').collect! {|n| n.to_i}
      end
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
