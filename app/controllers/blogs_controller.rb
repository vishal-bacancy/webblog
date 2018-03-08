class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_user

  respond_to :html, :js

  def upvote 
    @blog = Blog.find(params[:id])
    @blog.upvote_by current_user    
    respond_to do |format|
      format.html 
      format.js{
         render :template => "blogs/index.js.erb"                
     }
    end
    
  end  

  def downvote
    @blog = Blog.find(params[:id])
    @blog.downvote_by current_user
    respond_to do |format|
      format.html 
      format.js{
        render :template => "blogs/index.js.erb"
     }
  end
  end

  def set_user
    @usr = User.find_by_email(current_user.email)
  end

  def search
    @blogs =  Blog.ransack(title_cont: params[:term]).result(distinct: true)
    @users =  User.ransack(fname_cont: params[:term]).result(distinct: true)
    respond_to do |format|
      format.html {}
      format.json {
        @blogs = @blogs.limit(5)
        @users = @users.limit(5)  

      }
    end

  end

  # GET /blogs
  # GET /blogs.json
  def index
    @blog = Blog.new
    @blogs = @usr.blogs.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def all_blogs
    @blogs = Blog.all.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def my_blogs
    @blogs = @usr.blogs.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @comment = Comment.new
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    user = User.find_by_email(current_user.email)
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if user.blogs.create(title:@blog.title, content:@blog.content)
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
        
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :content)
    end

end