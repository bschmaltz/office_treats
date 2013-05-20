class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :up, :down]
  before_filter :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  def up
    @micropost = Micropost.find(params[:postID])
    @micropost.update_attribute("rating", @micropost.rating + 1)

    str = ""
    if current_user.upvoted == nil
      str = "[#{params[:postID].to_s}]"
    else
      str = "[#{params[:postID].to_s},#{current_user.upvoted[1..current_user.upvoted.length-2]}]"
    end
    current_user.update_column("upvoted", str)
    redirect_to root_url(:pflag => params[:pflag])
  end

  def down
    @micropost = Micropost.find(params[:postID])
    @micropost.update_attribute("rating", @micropost.rating - 1)

    str = ""
    if current_user.downvoted == nil
      str = "[#{params[:postID].to_s}]"
    else
      str = "[#{params[:postID].to_s},#{current_user.downvoted[1..current_user.downvoted.length-2]}]"
    end
    current_user.update_column("downvoted", str)
    redirect_to root_url(:pflag => params[:pflag])

  end

  def switch_to_up
    @micropost = Micropost.find(params[:postID])
    @micropost.update_attribute("rating", @micropost.rating + 2)

    ups = Array.new
    downs = Array.new
    if current_user.upvoted!=nil
      ups = current_user.upvoted[1..-2].split(',').collect! {|n| n.to_i}
    end
    if current_user.downvoted!=nil
      downs = current_user.downvoted[1..-2].split(',').collect! {|n| n.to_i}
    end
    ups.push(@micropost.id)
    downs = downs - ups

    current_user.update_column("upvoted", ups.to_s)
    current_user.update_column("downvoted", downs.to_s)
    redirect_to root_url(:pflag => params[:pflag])
  end

  def switch_to_down
    @micropost = Micropost.find(params[:postID])
    @micropost.update_attribute("rating", @micropost.rating - 2)

    ups = Array.new
    downs = Array.new
    if current_user.upvoted!=nil
      ups = current_user.upvoted[1..-2].split(',').collect! {|n| n.to_i}
    end
    if current_user.downvoted!=nil
      downs = current_user.downvoted[1..-2].split(',').collect! {|n| n.to_i}
    end
    downs.push(@micropost.id)
    ups = ups-downs

    current_user.update_column("upvoted", ups.to_s)
    current_user.update_column("downvoted", downs.to_s)
    redirect_to root_url(:pflag => params[:pflag])
  end

  private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end
end