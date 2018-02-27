module BlogsHelper

	def fetch_blogs(user)

		@blogs = user.blogs.order(created_at: :desc)

	end
end
