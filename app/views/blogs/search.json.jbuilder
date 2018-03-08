json.blogs	do 
	json.array!(@blogs) do |blog|
		json.name blog.title
		json.url blog_path(blog)	
	end

end

json.users	do 
	json.array!(@users) do |user|
		json.name user.fname
		json.url adminuser_path(user)	
	end

end