module CommentsHelper
	  def fetch_comments(blog)
    @comments = Comment.where(blog_id: blog.id)
    return @comments
  end

end
