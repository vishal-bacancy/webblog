class AdminDashboardController < ApplicationController
  def index
  	@total_user = User.count
  	@total_blog = Blog.count
  	@total_comment = Comment.count
  end
end
