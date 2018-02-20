class AdminusersController < ApplicationController
	before_action :get_params, only: [:create, :update]

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def edit
  	@user = User.find(params[:id])

  end

  def show

  	@user = User.find(params[:id])

  end

  def create
  	@user = User.new(get_params)
  	if @user.save
  		redirect_to adminusers_index_path
  	else
  		render 'new'
  	end
  end

  def update

  	@user = User.find(params[:user][:id])
    if @user.update(get_params)
    binding.pry

      redirect_to adminusers_index_path
  	else
  		render 'edit'
  	end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to adminusers_index_path
    else
      redirect_to adminusers_index_path
    end
  end

  def get_params
  	params.require(:user).permit(:email,:password,:password_confirmation)
  end


  
  
end
