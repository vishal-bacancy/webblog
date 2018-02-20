class DashboardController < ApplicationController
  def index
  	if user_signed_in?
  		if current_user.has_role? :blogger
  			redirect_to blogs_path
  		elsif current_user.has_role? :admin
  			redirect_to admin_dashboard_index_path
  		end
  	end
  end
  
end
