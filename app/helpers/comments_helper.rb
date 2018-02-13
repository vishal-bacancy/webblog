module CommentsHelper
	def fetch_comments(blog)
    @comments = Comment.where(blog_id: blog.id ).where(:parent_comment_id.nil?).order("created_at DESC")

    return @comments
  end

	def fetch_sub_comments(comm)
    @subcomments = Comment.where(parent_comment_id: comm.id).order("created_at DESC")
		return @subcomments
  end
end
