class RelationshipsController < ApplicationController
  def create
  	 @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to adminuser_path(@user)}
      format.js #{ redirect_to adminuser_path(@user)}
    end
  end

  def destroy
  	 @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to adminuser_path(@user) }
      format.js # => { redirect_to adminuser_path(@user)}
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    respond_to do |format|
      format.html { render 'show_follow'}
      format.js
    end
    
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    respond_to do |format|
      format.html { render 'show_follow'}
      format.js
    end
  end

end
