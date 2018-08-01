class AdmincommentsController < ApplicationController
 before_action :get_params, only: [:create, :update]

  def index
  	@comments = Comment.all
  end

  def new
  	@comment = Comment.new
  end

  def edit
  	@comment = Comment.find(params[:id])

  end

  def show

  	@comment = Comment.find(params[:id])

  end

  def create
  	@comment = Comment.new(get_params)
  	if @comment.save
  		redirect_to admincomments_index_path
  	else
  		render 'new'
  	end
  end

  def update

  	@comment = Comment.find(params[:user][:id])
    if @comment.update(get_params)

      redirect_to admincomments_index_path
  	else
  		render 'edit'
  	end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to admincomments_index_path
    else
      redirect_to admincomments_index_path
    end
  end

  def get_params
  	params.require(:comment).permit(:title,:content)
  end


  
end
