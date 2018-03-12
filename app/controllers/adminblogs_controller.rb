class AdminblogsController < ApplicationController
  before_action :get_params, only: [:create, :update]

  def index
  	@blogs = Blog.all
  end

  def new
  	@blog = Blog.new
  end

  def edit
  	@blog = Blog.find(params[:id])

  end

  def show

  	@blog = Blog.find(params[:id])
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render pdf: "blog",
               template: 'blogs/blog.pdf.erb',
               locals: {blog: @blog}
      end
    end
  end

  def create
  	@blog = Blog.new(get_params)
  	if @blog.save
  		redirect_to adminblogs_index_path
  	else
  		render 'new'
  	end
  end

  def update

  	@blog = Blog.find(params[:blog][:id])
    if @blog.update(get_params)

      redirect_to adminblogs_index_path
  	else
  		render 'edit'
  	end
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      redirect_to adminblogs_index_path
    else
      redirect_to adminblogs_index_path
    end
  end

  def get_params
  	params.require(:blog).permit(:title,:content)
  end


  
end
