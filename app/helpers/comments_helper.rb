module CommentsHelper
	  def fetch_comments(blog)
    @comments = Comment.where(blog_id: blog.id).order("created_at DESC")

    return @comments
  end

end
