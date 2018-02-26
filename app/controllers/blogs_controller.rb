class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_user

  def set_user
    @usr = User.find_by_email(current_user.email)
  end

  def download
    @blog = Blog.find(params[:id])

  end

  def success
  end

  def payment

     @amount = 10
     @blog = Blog.find(params[:id])
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'downloading e copy of blog',
    :currency    => 'inr'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to download_blog_path(@blog)

  end

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = @usr.blogs.order(created_at: :desc)
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
