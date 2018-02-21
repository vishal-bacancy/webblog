class Comment < ApplicationRecord
	belongs_to :blog
	belongs_to :user
	has_many :sub_comments, class_name: "Comment",	foreign_key: "parent_comment_id", dependent: :delete_all
	belongs_to :parent_comment, class_name: "Comment", optional: true
end
