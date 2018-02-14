class DashboardController < ApplicationController
  def index
  	if user_signed_in?
  		redirect_to blogs_path
  	end
  end
  
end
